package kb04.team02.web.mvc.common.entity;

import kb04.team02.web.mvc.common.entity.CurrencyCode;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Getter
@SuperBuilder
@AllArgsConstructor
@NoArgsConstructor
public abstract class WalletExchange {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "wallet_exchange_seq")
    @SequenceGenerator(name = "wallet_exchange_seq", allocationSize = 1, sequenceName = "wallet_exchange_seq")
    @Column(name = "wallet_exchange_id")
    private Long groupWalletExchangeId;

    @CreationTimestamp
    private LocalDateTime insertDate;

    @Enumerated(value = EnumType.ORDINAL)
    private CurrencyCode sellCurrencyCode;

    private Long sellAmount;
    private Long afterSellBalance;

    @Enumerated(value = EnumType.ORDINAL)
    private CurrencyCode buyCurrencyCode;

    private Long buyAmount;
    private Long afterBuyBalance;

    private Double exchangeRate;
}
