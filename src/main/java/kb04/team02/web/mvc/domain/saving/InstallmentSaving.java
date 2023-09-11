package kb04.team02.web.mvc.domain.saving;

import kb04.team02.web.mvc.domain.common.BooleanToYNConverter;
import kb04.team02.web.mvc.domain.wallet.group.GroupWallet;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class InstallmentSaving {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "installment_seq")
    @SequenceGenerator(name = "installment_seq", allocationSize = 1, sequenceName = "installment_seq")
    @Column(name = "installment_id")
    private Long installmentId;

    @CreationTimestamp
    private LocalDateTime insertDate;

    private LocalDateTime maturityDate;

    @Convert(converter = BooleanToYNConverter.class)
    private boolean isDone;

    private Long totalAmount;
    private LocalDateTime savingDate;
    private Long savingAmount;
    //== 연관관계 설정 START==//
    @ManyToOne
    @JoinColumn(name = "saving_id")
    private Saving saving;

    @OneToMany(mappedBy = "installmentSaving")
    private List<SavingHistory> savingHistories = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "group_wallet_id")
    private GroupWallet groupWallet;
    //== 연관관계 설정 END==//
}
