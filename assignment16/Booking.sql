CREATE TABLE "hosts" (
  "host_id" serial PRIMARY KEY,
  "name" varchar,
  "telephone" integer
);

CREATE TABLE "rooms" (
  "id_room" serial PRIMARY KEY,
  "id_host" integer,
  "amount_people" integer,
  "condition" boolean,
  "fridge" boolean,
  "balcony" boolean
);

CREATE TABLE "free_rooms" (
  "id_free" serial PRIMARY KEY,
  "id_room" integer,
  "date_free" timestamp,
  "date_ordered" timestamp,
  "cost" numeric
);

CREATE TABLE "guests" (
  "id_guest" serial PRIMARY KEY,
  "name" varchar,
  "telephone" integer
);

CREATE TABLE "orders" (
  "id_order" serial PRIMARY KEY,
  "id_guest" integer,
  "id_free" integer,
  "date_on" timestamp,
  "date_off" timestamp,
  "status" varchar
);

ALTER TABLE "rooms" ADD FOREIGN KEY ("id_host") REFERENCES "hosts" ("host_id");

ALTER TABLE "free_rooms" ADD FOREIGN KEY ("id_room") REFERENCES "rooms" ("id_room");

ALTER TABLE "orders" ADD FOREIGN KEY ("id_guest") REFERENCES "guests" ("id_guest");

ALTER TABLE "orders" ADD FOREIGN KEY ("id_free") REFERENCES "free_rooms" ("id_free");
