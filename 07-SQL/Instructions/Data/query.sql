-- Query Tables
SELECT * FROM card_holder;
SELECT * FROM credit_card;
SELECT * FROM merchant_category;
SELECT * FROM merchant;
SELECT * FROM transaction;

-- Join credit card and card holder
SELECT * FROM card_holder ch
LEFT JOIN credit_card cc on ch.card_holder_id = cc.card_holder_id;

-- Join merchant and merchant category
SELECT * FROM merchant_category mc
LEFT JOIN merchant m on mc.merchant_category_id = m.merchant_category_id;

-- Join transaction with joined credit card and joined merchant
SELECT * FROM transaction t
LEFT JOIN credit_card cc on t.credit_card_number = cc.credit_card_number
LEFT JOIN merchant m on t.merchant_id = m.merchant_id;
