package kb04.team02.web.mvc.service.saving;

import kb04.team02.web.mvc.saving.entity.Saving;
import kb04.team02.web.mvc.saving.dto.SavingDto;
import kb04.team02.web.mvc.saving.repository.SavingRepository;
import kb04.team02.web.mvc.saving.service.SavingService;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;
import org.springframework.test.annotation.Rollback;

import javax.transaction.Transactional;

import java.util.List;

@SpringBootTest
@Transactional
@Rollback
class SavingServiceImplTest {

    @Autowired
    private SavingService savingService;

    @Autowired
    private SavingRepository savingRepository;

    @AfterEach
    public void afterEach() {
        savingRepository.deleteAll();
    }

    @Test
    @DisplayName("selectSavings")
    public void selectSavings() throws Exception {
        //given
        savingRepository.save(Saving.builder()
                .name("saving1")
                .savingComment("ccccccccccccccccccomment")
                .interestRate(1.5)
                .period(6)
                .amountLimit(10000000L)
                .build());
        savingRepository.save(Saving.builder()
                .name("saving2")
                .savingComment("ccccccccccccccccccomment")
                .interestRate(1.5)
                .period(6)
                .amountLimit(10000000L)
                .build());
        savingRepository.save(Saving.builder()
                .name("saving3")
                .savingComment("ccccccccccccccccccomment")
                .interestRate(1.5)
                .period(6)
                .amountLimit(10000000L)
                .build());
        savingRepository.save(Saving.builder()
                .name("saving4")
                .savingComment("ccccccccccccccccccomment")
                .interestRate(1.5)
                .period(6)
                .amountLimit(10000000L)
                .build());
        //when
        List<SavingDto> savingDtos = savingService.selectSavings();
        for (SavingDto savingDto : savingDtos) {
            System.out.println("savingDto.getSavingId() = " + savingDto.getSavingId());
            System.out.println("savingDto.getName() = " + savingDto.getName());
            System.out.println("============================");
        }
        //then

    }

    @Test
    void selectSavingDetail() {
    }

    @Test
    void insertInstallmentSaving() {
    }
}