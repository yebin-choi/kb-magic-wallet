package kb04.team02.web.mvc.domain.wallet.personal;

import kb04.team02.web.mvc.domain.wallet.common.WalletExchange;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import net.bytebuddy.implementation.bind.annotation.Super;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@DiscriminatorValue("PersonalWalletExchange")
@SuperBuilder
public class PersonalWalletExchange extends WalletExchange {
    //== 연관관계 설정 START==//
    @ManyToOne
    @JoinColumn(name = "personal_wallet_id")
    private PersonalWallet personalWallet;
    //== 연관관계 설정 END==//
}
