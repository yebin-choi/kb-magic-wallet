package kb04.team02.web.mvc.controller.saving;

import kb04.team02.web.mvc.service.saving.SavingService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/saving")
@RequiredArgsConstructor
public class SavingController {

    private final SavingService savingService;

    /**
     * 적금 상품 메인 페이지 (상품조회)
     * API 명세서 ROWNUM:37
     */
    @GetMapping("/")
    public void savingIndex() {
    }

    /**
     * 적금 상품 상세 조회
     * API 명세서 ROWNUM:38
     *
     * @param id 상세 조회 할 적금 상품 id
     */
    @GetMapping("/{id}")
    public void savingDetail(@PathVariable String id) {
    }

    /**
     * 적금 상품 가입 폼
     * API 명세서 ROWNUM:39
     * 
     * @param id 가입 할 적금 상품 id
     */
    @GetMapping("/{id}/form")
    public void savingJoinForm(@PathVariable String id) {
    }

    /**
     * 적금 상품 가입
     * API 명세서 ROWNUM:40
     *
     * @param id 가입 할 적금 상품 id
     */
    @PostMapping("/{id}/form")
    public void savingJoin(@PathVariable String id) {
    }
}
