package kb04.team02.web.mvc.repository.wallet.personal;

import kb04.team02.web.mvc.domain.wallet.personal.PersonalWallet;
import kb04.team02.web.mvc.domain.wallet.personal.PersonalWalletPayment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PersonalWalletPaymentRepository extends JpaRepository<PersonalWalletPayment, Long> {

    /**
     * row 5-4
     *
     * select * personal_wallet_payment where personal_wallet_id = [personal_wallet_id];
     */

    List<PersonalWalletPayment> searchAllByPersonalWallet(PersonalWallet pw);
}
