#CSVを扱うライブラリを読み込む
require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"
#キーボードからの入力を取得
memo_type = gets.to_i

#入力が1の場合
if memo_type == 1
  puts "拡張子を除いたファイルを入力してください(新規)"
  #新規のファイルを入力するまで無限ループ
  loop do
    #キーボードからの入力を取得
    memo_new_file = gets.chomp
    #新規のファイルが入力された場合breakで終了
    if File.exist?("#{memo_new_file}.csv") == false
      puts "メモしたい内容を記入してください"
      puts "完了したらCtrl + Dを押します"
      memo = STDIN.read
      #openメソッド、引数にwで第一引数のCSVに新規書き込み
      CSV.open("#{memo_new_file}.csv","w") do |csv|
        #ファイルに書き込む
        csv.puts ["#{memo}"]
      end
      break
    #既存のファイルを入力するたびに出力
    else
      puts "すでに同じファイル名があります。新しいファイル名を入力してください"
    end
  end
#入力が2の場合
elsif memo_type == 2
  puts "拡張子を除いたファイルを入力してください(既存)"
  #既存のファイルを入力するまで無限ループ
  loop do
    #キーボードからの入力を取得
    memo_exist_type = gets.chomp
    #既存のファイルが入力された場合breakで終了
    if File.exist?("#{memo_exist_type}.csv") == true
      puts "メモしたい内容を記入してください"
      puts "完了したらCtrl + Dを押します"
      memo = STDIN.read
      #openメソッド、引数にaで第一引数のCSVに追加書き込み
      CSV.open("#{memo_exist_type}.csv","a") do |csv|
        #ファイルに書き込む
        csv.puts ["#{memo}"]
      end
      break
    #既存にないファイルを入力するたびに出力
    else
      puts "既存のファイルを入力してください"
    end
  end
#入力が1と2以外の場合
else
  puts "半角で1か2を入力してください"
end

#入力が2の場合で参照できないCSVファイイルが入力された時にエラー処理をする
