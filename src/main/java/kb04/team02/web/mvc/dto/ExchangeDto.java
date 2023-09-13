package kb04.team02.web.mvc.dto;

import kb04.team02.web.mvc.domain.common.CurrencyCode;
import kb04.team02.web.mvc.domain.wallet.common.WalletType;
import kb04.team02.web.mvc.domain.wallet.group.GroupWallet;
import kb04.team02.web.mvc.domain.wallet.group.GroupWalletExchange;
import kb04.team02.web.mvc.domain.wallet.personal.PersonalWallet;
import kb04.team02.web.mvc.domain.wallet.personal.PersonalWalletExchange;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ExchangeDto {

    private CurrencyCode sellCurrencyCode;
    private Long sellAmount;
    private Long afterSellBalance;
    private CurrencyCode buyCurrencyCode;
    private Long buyAmount;
    private Long afterBuyBalance;
    private Double exchangeRate;
    private Long walletId;
    private WalletType walletType;

    public static PersonalWalletExchange toPersonalEntity(ExchangeDto exchangeDto, PersonalWallet personalWallet){
        return PersonalWalletExchange.builder()
                .sellCurrencyCode(exchangeDto.getSellCurrencyCode())
                .sellAmount(exchangeDto.getSellAmount())
                .afterSellBalance(exchangeDto.getAfterSellBalance())
                .buyCurrencyCode(exchangeDto.getBuyCurrencyCode())
                .buyAmount(exchangeDto.getBuyAmount())
                .afterBuyBalance(exchangeDto.getAfterBuyBalance())
                .exchangeRate(exchangeDto.getExchangeRate())
                .personalWallet(null)
                .build();
    }

    public static GroupWalletExchange toGroupEntity(ExchangeDto exchangeDto, GroupWallet groupWallet){
        return GroupWalletExchange.builder()
                .sellCurrencyCode(exchangeDto.getSellCurrencyCode())
                .sellAmount(exchangeDto.getSellAmount())
                .afterSellBalance(exchangeDto.getAfterSellBalance())
                .buyCurrencyCode(exchangeDto.getBuyCurrencyCode())
                .buyAmount(exchangeDto.getBuyAmount())
                .afterBuyBalance(exchangeDto.getAfterBuyBalance())
                .exchangeRate(exchangeDto.getExchangeRate())
                .groupWallet(null)
                .build();
    }
}
