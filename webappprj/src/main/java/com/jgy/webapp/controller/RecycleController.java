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
		// 이미지 파일을 읽는 부분이다. FileInputStream은 자바 자체의 기능이지만 ByteString이라는 타입은 구글 API에서
		// 제공하는 것 같고 이 형식으로 이미지를 읽는다.
//		String imageFilePath = "C:\\Users\\niceg\\Downloads\\vision_example.png";
		String imageFilePath = path;
		ByteString imgBytes = ByteString.readFrom(new FileInputStream(imageFilePath));

		// 서버로 분석 요청을 보내기 위해 AnnotateImageRequest라는 객체를 생성하는 부분이다. ArrayList로 만든건 여러개의
		// 이미지를 한번의 요청으로 처리할 수도 있어서 그런 것 같지만 예제에서는 1개의 이미지 파일이니 큰 의미 없다.
		// TEXT_DETECTION은 일반적인 사진에서 이미지를 추출하기 위한 타입이고 다른 타입도 있다. 예를 들어
		// DOCUMENT_TEXT_DETECTION으로 바꿔주면 책처럼 밀집된 문서에 더 알맞도록 최적화된다.
		List<AnnotateImageRequest> requests = new ArrayList<>();
		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
		AnnotateImageRequest req = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(req);
		String result = "";

		// 만들어진 AnnotateImageRequest를 클라이언트 요청에 담아 보내서 Response 객체를 받아오는 부분이다.
		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse resp = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = resp.getResponsesList();

			// 1개의 이미지만 넣었기 때문에 response도 하나이고, 따라서 for문은 별 의미는 없다.
			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.println(res.getError().getMessage());
					return "error";
					// return "/main/login";
				}
				// Response 객체에 담겨져 온 분석 결과 (이미지 내의 텍스트) 가 여기서 출력된다.
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