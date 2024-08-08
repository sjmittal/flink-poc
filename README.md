# Local setup

1. Install Java 1.8

2. Download Flink 1.8.1 -> https://archive.apache.org/dist/flink/flink-1.18.1/

3. Install Flink -> `tar -xzf flink-1.18.1-bin-scala_2.12.tgz`

4. Install Clickhouse -> https://clickhouse.com/docs/en/install#quick-install
    - Start Clickhouse server -> `./clickhouse server`
    - Create schema -> `schema.sql`

5. Modify `flink-conf.yaml`
    - `taskmanager.memory.process.size: 6g`
    - `state.backend.type: rocksdb`
    - `state.checkpoints.dir: file:///tmp`
    - `state.backend.incremental: true`

6. Run Flink:
    - `cd flink-1.18.1`
    - from flink root -> `./bin/start-cluster.sh`
    - Visit -> http://localhost:8081

7. Build jar (from project root) -> `mvn clean package -Dmaven.test.skip=true`

8. Run SKU processor (from flink root)

`./bin/flink run /path/to/skuprocessor/target/SkuProcessor.jar`

