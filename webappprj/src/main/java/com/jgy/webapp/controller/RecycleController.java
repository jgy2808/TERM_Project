package com.jgy.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;

@Controller
public class RecycleController {
	@RequestMapping("/recycle")
	public String recycle() {
		return "term/recycle/recycle";
	}
	
	public String textMining(String path) throws FileNotFoundException, IOException {
		// �̹��� ������ �д� �κ��̴�. FileInputStream�� �ڹ� ��ü�� ��������� ByteString�̶�� Ÿ���� ���� API����
		// �����ϴ� �� ���� �� �������� �̹����� �д´�.
//		String imageFilePath = "C:\\Users\\niceg\\Downloads\\vision_example.png";
		String imageFilePath = path;
		ByteString imgBytes = ByteString.readFrom(new FileInputStream(imageFilePath));

		// ������ �м� ��û�� ������ ���� AnnotateImageRequest��� ��ü�� �����ϴ� �κ��̴�. ArrayList�� ����� ��������
		// �̹����� �ѹ��� ��û���� ó���� ���� �־ �׷� �� ������ ���������� 1���� �̹��� �����̴� ū �ǹ� ����.
		// TEXT_DETECTION�� �Ϲ����� �������� �̹����� �����ϱ� ���� Ÿ���̰� �ٸ� Ÿ�Ե� �ִ�. ���� ���
		// DOCUMENT_TEXT_DETECTION���� �ٲ��ָ� åó�� ������ ������ �� �˸µ��� ����ȭ�ȴ�.
		List<AnnotateImageRequest> requests = new ArrayList<>();
		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
		AnnotateImageRequest req = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(req);
		String result = "";

		// ������� AnnotateImageRequest�� Ŭ���̾�Ʈ ��û�� ��� ������ Response ��ü�� �޾ƿ��� �κ��̴�.
		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse resp = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = resp.getResponsesList();

			// 1���� �̹����� �־��� ������ response�� �ϳ��̰�, ���� for���� �� �ǹ̴� ����.
			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.println(res.getError().getMessage());
					return "error";
					// return "/main/login";
				}
				// Response ��ü�� ����� �� �м� ��� (�̹��� ���� �ؽ�Ʈ) �� ���⼭ ��µȴ�.
				System.out.println("Text : ");
//				System.out.println(res.getTextAnnotationsList().get(0).getDescription());
//				result = res.getTextAnnotationsList().get(0).getDescription();
				StringTokenizer st = new StringTokenizer(res.getTextAnnotationsList().get(0).getDescription(), "\n");
				result = st.nextToken();
				System.out.println("String Tokenizer 0 index : " + result);
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "error";
	}
	
	@ResponseBody
	@RequestMapping(value = "/multipartUpload.do", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String multipartUpload(MultipartHttpServletRequest request) throws Exception {
		System.out.println("multipartUpload call !!!");
		String path = request.getSession().getServletContext().getRealPath("/");
		System.out.println("image file : " + request + " " + request.getParameter("imgFile")  + " " + path + " ");
		Iterator<String> it = request.getFileNames();
		String first_text = "";
		if(it.hasNext()) {
			List<MultipartFile> mpf = request.getFiles(it.next().toString());
			for (int i = 0; i < mpf.size(); i++) {
				String filename = path + "/" + mpf.get(i).getOriginalFilename();
				System.out.println("filename : " + filename);
				File file = new File(filename);
				mpf.get(i).transferTo(file);
				first_text = textMining(filename); 
			}
		}
		return first_text;
	}
}