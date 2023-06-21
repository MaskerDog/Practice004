# 課題04

## 作成日

2023年6月19日

## 使い方（課題01をやっている学生は2を飛ばす）

1. ターミナルを起動する
1. ターミナルで`mkdir ~/Documents/iOSPractice`と入力して新しいフォルダを作成する
1. 上記を実行後、ターミナルに`cd ~/Documents/iOSPractice`と入力してディレクトリを移動する
1. ディレクトリを移動したら、ターミナルに`git clone https://github.com/MaskerDog/Practice004.git`と入力して、リポジトリをローカルにクローンする（自分のPCにダウンロードするようなもの）
1. クローンができたら`open Practice004/Practice004.xcodeproj/`と入力してXcodeでプロジェクトを開く
1. Xcodeからシミュレーターを起動する
1. 次の画像が表示されることを確認する

<kbd><img height="500" alt="image" src="https://github.com/MaskerDog/Practice004/assets/37284851/b29d34cd-6ff6-48d4-93a4-7ecc7ae31b1c"></kbd>


## 目的

1. Labelを使うことができる
2. Textの連結ができる
3. Groupを使うことができる
4. これまで体験した内容を用いて、イメージからアプリを作成する

## やること1

まず模写をする。  
SampleBurgerを次のように修正をする。  

```Swift
struct SampleBurger: View {
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("アボカドバーガー")
                    .font(.mplus(weight: .black, size: .extraLarge))
                Text("Avocado Burger")
                    .font(.mplus(weight: .bold, size: .large))
                    .foregroundColor(.green)
            }
            
            Image("burger")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .padding(.horizontal, 5)
                
            HStack {
                Spacer()
                Text("1590円")
                    .font(.mplus(weight: .black, size: .large)) +
                Text("(税込1749円)")
                    .font(.mplus(weight: .regular, size: .small))
            }
                
            Rectangle()
                .fill(.gray)
                .frame(height: 1)
            Text("アボカドとさっぱりとした具材たっぷりのタルタルソースをトッピング。女性からの支持が高い人気商品。")
                .font(.mplus(weight: .regular, size: .middle))
            
            Rectangle()
                .fill(.gray)
                .frame(height: 1)
            
            Spacer()
            
            Group {
                Text("アレルギー表示")
                    .font(.mplus(weight: .black, size: .middle))
                Text("法令で規定する特定原材料7品目")
                    .font(.mplus(weight: .regular, size: .middle))
                VStack (alignment: .leading, spacing: 4) {
                    Label {
                        Text("小麦")
                            .font(.mplus(weight: .regular, size: .extraSmall))
                    } icon: {
                        Image("gluten")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                    }
                
                    Label {
                        Text("卵")
                            .font(.mplus(weight: .regular, size: .extraSmall))
                    } icon: {
                        Image("egg")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                    }
                    
                    Label {
                        Text("乳")
                            .font(.mplus(weight: .regular, size: .extraSmall))
                    } icon: {
                        Image("milk")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                    }
                }
                .padding(.leading, 10)
                
            }
        }
        .padding()
    }
}
```

シミュレーターで実行し、サンプルのタブを選択して以下の画面が表示されることを確認する。

<kbd><img height="500" alt="image" src="https://github.com/MaskerDog/Practice004/assets/37284851/dcc73d70-1505-4b04-ba38-531daaaede45"></kbd>

### 説明1

Labelはアイコンとテキストを同時に表示することができるViewである。   
SF symbolsを使う場合は次のように書く。  

```Swift
Label("タイトル", systemImage: "ladybug.fill")
```

<kbd><img width="182" alt="image" src="https://github.com/MaskerDog/Practice004/assets/37284851/f67e58c9-1c32-4400-99aa-3d63454b6f56"></kbd>

Assetsにある画像を使って表示したい場合は次のように書く。

```Swift
Label(title: {Text("Label名")},
      icon: {Image("milk")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 25, height: 25)
})
```

<kbd><img width="172" alt="image" src="https://github.com/MaskerDog/Practice004/assets/37284851/543baa6e-9943-4815-9dff-975e02bb3722"></kbd>

ただし、この書き方は読みにくくなるため、次のように変形して書く。


```Swift
Label {
    Text("Label名")
} icon: {
    Image("milk")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 25, height: 25)
}
```

### 説明2

一つのブロック`{}`に書けるViewの数は10個までである。  
したがって、10個以上のViewを一つのブロックに書く場合はブロックを分割する必要がある。  

Groupは複数のViewをまとめて可読性を高めたり、10個以上のViewとなって表示が不可となった場合に使用する。  
ただし、通常は10個以上のViewをまとめるようなことにならないよう、Viewを分けるなど対策をすべきである。

```Swift
struct ExampleView: View {
   var body: some View {
       VStack {
           Group {
               Text("Line 1")
               Text("Line 2")
               Text("Line 3")
               Text("Line 4")
               Text("Line 5")
               Text("Line 6")
               Text("Line 7")
               Text("Line 8")
               Text("Line 9")
               Text("Line 10")
              }
            
           Group {
               Text("Line 11")
               Text("Line 12")
           }
       }
   }
}
```

### 説明3

一つの行に異なる装飾がされたTextを連結するには`+`を用いる。

```Swift
Text("1590円")
    .font(.mplus(weight: .black, size: .large)) +
Text("(税込1749円)")
    .font(.mplus(weight: .regular, size: .small))
```

### 説明4

以下のプログラムは、カスタマイズしたフォントを定義してあり、そのフォントを利用している。

```Swift
 .font(.mplus(weight: .black, size: .extraLarge))
 ```
 
 太さは3種類（black,bold,その他）、大きさは５種類（extraLarge（とても大きい）、large(大きい）、middle(普通）、small(小さい）、extraSmall(とても小さい））である。

```Swift
.font(.mplus(weight: .regular, size: .extraLarge))
```

この書き方であれば、通常の太さで、とても大きいフォントサイズで表示される。  
**これはSwiftUIがあらかじめ持っている機能ではなく、個別に定義をしたものであり他のプログラムで使おうとしても使うことができない。**

## やること2

やること1のサンプルを参考にし、次の画像の通りに表示されるよう、AvocadoBurger.swiftを修正する。

<kbd><img height="500" alt="image" src="https://github.com/MaskerDog/Practice004/assets/37284851/503c36cf-d631-4792-afd5-15e8386f2836"></kbd>

<hr>

このアプリケーションには、SIL OPEN FONT LICENSE Version 1.1で定められた条件に基づいて配布されているフォントが含まれています。  
フォントの詳細およびライセンステキストについては、以下のリンク先を参照してください:  
[M+ FONTS ダウンロード](https://mplusfonts.github.io/)
[M+ FONTS 自家製](http://jikasei.me/font/mgenplus/) 
Licensed under [SIL Open Font License 1.1](http://scripts.sil.org/OFL)
           
