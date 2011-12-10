rake = make + shell script
===================================================================
Rubyで書かれたビルドツールrakeの紹介

For Ruby 1.8.7, rake 0.8.7

------
makeの仕事(ビルドツール編)
===================================================================
以下のようなMakefileがあるとして

    CC=clang -Wall -Wextra -std=c++0x

    hello: hello.c hello.h
        $(CC) -o hello hello.c

「`hello` は `hello.c` と `hello.h` から作られる。また、その時のコマンドは `$(CC) ...` を呼び出す」と読む。コマンドは `hello.c` と `hello.h` のどちらかが更新されたときのみ起動される。この生成物(`hello`)を __ターゲット__ と呼ぶ。また、一つのターゲットに結び付けられた処理全体を __タスク__ と呼ぶ。

依存関係を管理して必要なファイルだけコンパイルするツールということ。

ドキュメントの生成なども同じメカニズムで処理できる。

------
makeの仕事(ランチャー編)
===================================================================
任意のターゲットと一連のシェルコマンドを組み合わせることができるため、ランチャーとしても使われることがある。

    test: hello
        ./hello

このターゲットは `make target` で起動するが、ファイルはおそらく作られない。生成した `hello` を起動するだけである。

つまり、シェルコマンドを起動するためのランチャーとして使われることもある。


------
makeの欠点
===================================================================
複雑な処理がしにくい。条件分岐やループは難しい。しょうがないので複雑なビルドプロセスは別のファイルのシェルスクリプトに書いたりする。

依存ファイルをワイルドカードで指定したりできない。
しょうがないのでMakefileを生成するスクリプトを書いたりする。

しょうがないのでautotoolsでconfigureスクリプト生成し、configureスクリプトがMakefileを生成し、makeでビルドするという一連の作業をする習慣ができた。

これは処理が複雑だしメンテナンスもしにくい。





