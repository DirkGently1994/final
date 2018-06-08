class P {
  float ang;    //  進行角度
  PVector pos;  //  位置
  float v;      //  速度
  int depth;    //  深さ
  float size;   //　大きさ

  P() {
    pos = new PVector();
  }

  //  初期化
  void init(float _ang, float x, float y, float _v, int _depth, float _size) {
    ang = _ang;
    pos.set(x, y);
    v = _v;
    depth = _depth;
    size = _size;
  }

  //  子として生まれる
  void born(P p, float _ang) {
    ang = p.ang + _ang;
    pos.set(p.pos.x, p.pos.y);
    depth = p.depth - 1;
    v = p.v * (0.4 * depth) * (random(0.2) + 0.8);
    size = p.size;
  }

  //  描画動作
  void act() {

    //  パラメータ変更
    pos.add(cos(ang) * v, sin(ang) * v);
    v -= 0.02;

    //  描画
    translate(width / 2, height / 2);
    for (int i = 0; i < 6; i++) {
      ellipse(pos.x, pos.y, size, size);
      rotate(radians(60));
    }
    translate(- width / 2, -height / 2);
  }
}

ArrayList<P> perticles = new ArrayList<P>();
float generateRatio; //  子供性確率変数
float waitCount;  //  描画終了後の待機時間

//-------------------------------------------------
//  setup
//--------------------------------------------------

//--------------------------------------------------
//  初期化処理
//--------------------------------------------------
void init() {
  fill(255, 255);
  noStroke();  

  perticles.clear();

  P p = new P();
  p.init(random(5), 0, 0, random(1) + 2, 3, random(2) + 1);
  perticles.add(p);

  generateRatio = random(0.03) + 0.02;
}

int c = 0;

 

//--------------------------------------------------
//  描画完了後の余韻
//--------------------------------------------------
void waiting() {
  fill(0, 8);
  rect(0, 0, width, height);
  waitCount++;
  if (waitCount >= 10) {
    waitCount = 0;
    init();
  }
}

//--------------------------------------------------
//  描画メイン処理
//--------------------------------------------------
void drawing() {

  ArrayList<P> childs = new ArrayList<P>();  //  今回生まれた子
  ArrayList<P> deads = new ArrayList<P>();   //  今回死ぬパーティクル

  for (P p : perticles) {
    p.act();
    if (p.v <= 0) {
      deads.add(p);
    }

    if (random(1) < (generateRatio * p.depth)) {
      float r = random(5) + 20;
      P child1 = new P();
      child1.born(p, radians(r));
      childs.add(child1);
      P child2 = new P();
      child2.born(p, radians(-r));
      childs.add(child2);
    }
  }

  //  リストから生まれた子を追加
  for (P child : childs) {
    perticles.add(child);
  }

  //  リストから死んだ子を削除
  for (P dead : deads) {
    perticles.remove(dead);
  }
}