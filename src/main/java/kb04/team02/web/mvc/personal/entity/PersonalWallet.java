package kb04.team02.web.mvc.personal.entity;

import kb04.team02.web.mvc.exchange.entity.OfflineReceipt;
import kb04.team02.web.mvc.member.entity.Member;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Builder
@Setter
@DynamicInsert
@DynamicUpdate
public class PersonalWallet {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "wallet_seq")
    @SequenceGenerator(name = "wallet_seq", allocationSize = 1, sequenceName = "wallet_seq")
    @Column(name = "personal_wallet_id")
    private Long personalWalletId;

    @ColumnDefault("0")
    private Long balance;

    //== 연관관계 설정 START==//
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "member_id")
    private Member member;

    @OneToMany(mappedBy = "personalWallet")
    private List<PersonalWalletTransfer> personalWalletTransfer = new ArrayList<>();

    @OneToMany(mappedBy = "personalWallet")
    private List<PersonalWalletExchange> personalWalletExchanges = new ArrayList<>();

    @OneToMany(mappedBy = "personalWallet")
    private List<PersonalWalletPayment> personalWalletPayments = new ArrayList<>();

    @OneToMany(mappedBy = "personalWallet")
    private List<PersonalWalletForeignCurrencyBalance> foreignCurrencyBalances = new ArrayList<>();

    @OneToMany(mappedBy = "personalWallet")
    private List<OfflineReceipt> offlineReceipts = new ArrayList<>();
    //== 연관관계 설정 END==//
}
