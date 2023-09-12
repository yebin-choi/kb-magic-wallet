package kb04.team02.web.mvc.repository.wallet.group;

import kb04.team02.web.mvc.domain.wallet.group.GroupWallet;
import kb04.team02.web.mvc.domain.wallet.group.GroupWalletForeignCurrencyBalance;
import kb04.team02.web.mvc.domain.wallet.group.Participation;
import kb04.team02.web.mvc.domain.wallet.group.Participation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ParticipationRepository extends JpaRepository<Participation, Long> {
    /**
     * ROWNUM 16
     * 내 모임지갑의 모임원 리스트 불러오기
     *
     * select m.name, p.authority from member m
     * left outer join participation p
     * on m.member_id = p.member_id where p.group_wallet_id = “현재세션모임지갑”
     **/
    // -> join하는거 보류.
    List<Participation> findByParticipationStateIsTrue(Long groupWalletId);

    /**
     * ROWNUM 17
     * 내 모임지갑에서 본인이 탈퇴하기
     * <p>
     * SQL
     * <p>
     * update participation
     * set state = ‘참여안함’
     * where member_id = ‘현재 나의 세션’
     * <p>
     * JPA : ParticipationRepository.save(int memberId);
     */

    /**
     * 내가 참여중/참여했던 모임지갑
     * @param memberId
     * @return
     */
    List<Participation> findByMemberId(Long memberId);
}
