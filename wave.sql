1. SELECT COUNT (u_id) FROM users;

2. SELECT COUNT (u_id) FROM transfers WHERE send_amount_currency = 'CFA';
    SELECT COUNT (transfer_id) FROM transfers WHERE send_amount_currency = 'CFA';

3. SELECT (u_id) FROM transfers WHERE send_amount_currency = 'CFA';

4. SELECT COUNT(atx_id) FROM agent_transactions GROUP BY when_created;

5. SELECT COUNT(atx_id) FROM agent_transactions 
WHERE (amount< 0 or amount < 0)
AND when_created
BETWEEN '2020-07-12' AND '2020-07-19';
 
6.  SELECT City, Volume INTO atx_volume_city_summary FROM 
(SELECT agents.city AS City, COUNT (agent_transactions.atx_id) 
AS Volume FROM agents 
INNER JOIN agent_transactions
ON agents.agent_id = agent_transactions.agent_id WHERE
(agent_transactions.when_created > (NOW() - INTERVAL '1 week')
GROUP BY agents.city) AS atx_volume_summary);


7.  SELECT City, Volume, Country INTO 
atx_volume_city_summary_with_COUNTRY 
FROM (SELECT agents.city AS City, agents.country AS Country, 
	 COUNT (agent_transactions.atx_id)
	 AS Volume FROM agents INNER JOIN agent_transactions ON
	 agents.agent_id = agent_transactions.agent_id WHERE
	 (agent_transactions.when_created > (NOW() - INTERVAL '1 week'))
	 GROUP BY agents.country, agents.city) AS
	 atx_volume_summary_with_Country;

8. SELECT transfers.kind AS kind, wallets.ledger_location 
AS Country, 
SUM (transfers.send_amount_scalar) AS
Volume FROM transfers
INNER JOIN wallets ON transfers.source_wallet_id = wallets.wallet_id
WHERE (transfers.when_created > (NOW() - INTERVAL '1 week')) 
GROUP BY wallets.ledger_location, transfers.kind;

9. SELECT COUNT (transfers.source_wallet_id)
AS Unique_senders, COUNT (transfer_id)
AS Transaction_count, transfers.kind
AS transfer_kind, wallets.ledger_location
AS country,
SUM (transfers.send_amount_scalar) AS volume 
FROM transfers
INNER JOIN wallets
ON transfers.source_wallet_id = wallets.wallet_id
WHERE (transfers.when_created > (NOW() - INTERVAL '1 week'))
GROUP BY wallets.ledger_location, transfers.kind;

10. SELECT source_wallet_id, send_amount_scalar 
FROM transfers WHERE 
send_amount_currency = 'CFA' AND
(send_amount_scalar > 10000000) AND
(transfers.when_created > (NOW() - INTERVAL '1 month'));
