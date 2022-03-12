import 'package:redis/redis.dart';

class RedisService extends RedisConnection {
  final RedisConnection conn;
  late Command cmd;
  late PubSub pubsub;

  RedisService({required this.conn}) {
    _connect();
  }

  void _connect() async {
    cmd = await conn.connect(
        'redis-16930.c100.us-east-1-4.ec2.cloud.redislabs.com', 16930);
    await cmd.send_object(["AUTH", "J83blOvjFhjWlqBCYZo27Io6iOdvJDcT"]);
    pubsub = PubSub(cmd);
    subscribe(['61f6c11ccf62e86900d39a57']);
  }

  void subscribe(List<String> channels) {
    pubsub.subscribe(channels);
  }

  Stream<dynamic> getStream() => pubsub.getStream();

  Future<void> close() async {
    conn.close();
    return super.close();
  }

  //  try {
  //   // final conn = RedisConnection();

  //   final
  //   print(cmd);
  //   print(pubsub.toString());

  //   pubsub.getStream().listen((message) {
  //     print("message: $message");
  //   });
  // } catch (ex) {
  //   print(ex);
  // }
}
