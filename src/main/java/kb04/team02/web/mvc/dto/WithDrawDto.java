package kb04.team02.web.mvc.dto;

import kb04.team02.web.mvc.domain.common.CurrencyCode;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@ToString
public class WithDrawDto {
    private CurrencyCode currencyCode;
    private Long amount;
    private Long srcWalletId;
    private Long destMemberId;
}