import 'package:onlive/core/secure_storage/secure_storage.dart';

import '../../dummy_data.dart';
import 'package:redis/redis.dart';

class RedisService extends RedisConnection {
  final RedisConnection conn;
  final SecureStorage storage;
  late Command cmd;
  late PubSub pubsub;

  RedisService({required this.conn, required this.storage}) {
    _connect();
  }

  void _connect() async {
    cmd = await conn.connect(
        'redis-16930.c100.us-east-1-4.ec2.cloud.redislabs.com', 16930);
    await cmd.send_object(["AUTH", "J83blOvjFhjWlqBCYZo27Io6iOdvJDcT"]);
    pubsub = PubSub(cmd);
    final userId = await storage.readUid();
    print(userId);
    subscribe([userId]);
  }

  void subscribe(List<String> channels) {
    pubsub.subscribe(channels);
  }

  Stream<dynamic> getStream() => pubsub.getStream();

  Future<void> close() async {
    conn.close();
    return super.close();
  }
}
