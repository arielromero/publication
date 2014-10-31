select members.* From subscriptions 
join members on (members.id = subscriptions.member_id)
where campaign_id = 1
and member_id not in (select member_id From subscriptions s2 where s2.campaign_id = 4)