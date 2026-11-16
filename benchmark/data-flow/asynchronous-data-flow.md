# Asynchronous data flow — IBM hybrid modernization

## Kafka topology

From `scripts-docker/docker-compose-kafka.yml`:

- Zookeeper + Kafka (`strimzi/kafka:0.19.0-kafka-2.5.0`)
- Advertised listener default `PLAINTEXT://kafka:9092` (README warns to change for local Quarkus dev)

## Producer

`catalog/.../ProductResource.sendMessageToKafka`:

- Topic: `product-price-updated`
- Value: `productId + "#" + price`
- Client: Vert.x `KafkaProducer`

## Consumer

`ProductPriceChanged` with `@Incoming("product-price-updated")` (SmallRye Reactive Messaging) — logs message and returns it.

Configured in `application.properties`:

```
mp.messaging.incoming.product-price-updated.connector=smallrye-kafka
kafka.bootstrap.servers=kafka:9092
```

## PII note

Current Kafka payload is **not customer PII**. The async infrastructure is still relevant for benchmark scenarios that later extend events to include customer/order identifiers.

## Unavailable

- No runtime consumer group inspection.
- No schema registry.
- No CDC from Db2 in this repository (unlike YAS).
