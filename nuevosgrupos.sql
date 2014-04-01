INSERT INTO product_received_groups(campaign_id, description, created_at, updated_at)
    VALUES ( 1, 'Segundo Trimestre', current_timestamp, current_timestamp);

INSERT INTO product_received_groups(campaign_id, description, created_at, updated_at)
    VALUES ( 2, 'Febrero', current_timestamp, current_timestamp);

INSERT INTO product_received_groups(campaign_id, description, created_at, updated_at)
    VALUES ( 2, 'Marzo', current_timestamp, current_timestamp);


ALTER TABLE product_receiveds
  ADD COLUMN product_received_group_id integer;