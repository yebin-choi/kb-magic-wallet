package kb04.team02.web.mvc.mypage.entity;

import kb04.team02.web.mvc.member.entity.Member;
import kb04.team02.web.mvc.common.entity.WalletType;

import lombok.*;

import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class CardIssuance {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "card_issuance_seq")
    @SequenceGenerator(name = "card_issuance_seq", allocationSize = 1, sequenceName = "card_issuance_seq")
    @Column(name = "card_issuance_id")
    private Long cardIssuanceId;

    @CreationTimestamp
    private LocalDateTime insertDate;

    @Column(unique = true, length = 20)
    private String cardNumber;

    @Enumerated(EnumType.ORDINAL)
    private CardState cardState;

    private Long walletId;

    @Enumerated(EnumType.ORDINAL)
    private WalletType walletType;

    //== 연관관계 설정 START==//
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;
    //== 연관관계 설정 END==//

    //== 메소드 START ==//
    public void changeStateOk() {
        this.cardState = CardState.OK;
    }

    public void changeStateStop(){
        this.cardState = CardState.STOP;
    }

    public void changeStateTemporalStop() {
        this.cardState = CardState.TEMPORAL_STOP;
    }
    //== 메소드 END ==//
}
