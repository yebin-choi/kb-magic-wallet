package kb04.team02.web.mvc.exchange.entity;


import kb04.team02.web.mvc.common.entity.CurrencyCode;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Builder
public class ExchangeRate {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "exchange_rate_seq")
    @SequenceGenerator(name = "exchange_rate_seq", allocationSize = 1, sequenceName = "exchange_rate_seq")
    @Column(name = "exchange_rate_id")
    private Long exchangeRateId;

    @Enumerated(EnumType.ORDINAL)
    private CurrencyCode currencyCode;

    private Double tradingBaseRate;
    private Double telegraphicTransferBuyingRate;
    private Double telegraphicTransferSellingRate;
    private Double buyingRate;
    private Double sellingRate;

    private LocalDateTime insertDate;
}
