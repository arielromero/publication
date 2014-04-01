-- Table: product_received_groups

-- DROP TABLE product_received_groups;

CREATE TABLE product_received_groups
(
  id serial NOT NULL,
  campaign_id integer,
  description character varying(255),
  created_at timestamp without time zone NOT NULL,
  updated_at timestamp without time zone NOT NULL,
  CONSTRAINT product_received_groups_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE product_received_groups
  OWNER TO krhmjatlkyxgtz;
