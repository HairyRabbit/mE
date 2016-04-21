BEGIN;

INSERT INTO post(
  title,
  istop,
  intro,
  filepath
)
VALUES(
  'Hi.这里是兔子',
  true,
  'Hi，这里是兔子，嗯就是这样，我的 Blog 和大家见面了。跳票了那么久还是要先说一声，so sorry。哦对了，我是一个Frontend Developer，喜欢reding，喜欢coding，喜欢折腾各类黑科技，据说这次的改版有不少新东西呢，快点进来看看吧！',
  'hello'
)


COMMIT;
$$
LANGUAGE plpgsql;
