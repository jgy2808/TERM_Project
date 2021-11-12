package com.jgy.webapp.jpa;

import java.util.Optional;
import com.jgy.webapp.security.CustomUserDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
public interface UserRepository extends JpaRepository<CustomUserDetails, Long> {
	Optional<CustomUserDetails> findByUsername(String username);
}
//public interface UserRepository extends JpaRepository<CustomUserDetails, Long> {
//	Optional<CustomUserDetails> findByUsername(String username);
//}