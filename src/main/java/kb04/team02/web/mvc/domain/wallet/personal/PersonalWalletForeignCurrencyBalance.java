package kb04.team02.web.mvc.domain.wallet.personal;

import kb04.team02.web.mvc.domain.wallet.common.ForeignCurrencyBalance;
import kb04.team02.web.mvc.domain.wallet.group.GroupWallet;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@DiscriminatorValue("PersonalWalletForeignCurrencyBalance")
public class PersonalWalletForeignCurrencyBalance extends ForeignCurrencyBalance{
    //== 연관관계 설정 START==//
    @ManyToOne
    @JoinColumn(name = "personal_wallet_id")
    private PersonalWallet personalWallet;
    //== 연관관계 설정 END==//
}
