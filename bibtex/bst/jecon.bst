% jecon.bst: 経済学用 BibTeX style file.
%
% First-written:       <2002/11/03>
% Time-stamp:	       <2004-12-13 16:40:01 Shiro Takeda>
% Version 1.10
% $Id: jecon.bst,v 1.25 2004/12/13 07:40:17 st Exp $
%
% これは，飯田修さんによって作成された jpolisci.bst を経済学用に
% 武田史郎 <zbc08106@park.zero.ad.jp> が改変したものです．
% 改変には
%
% aer.bst, jfm.bst, jplain.bst
% 萩平哲さんによる <http://www.med.osaka-u.ac.jp/pub/anes/www/latex/bibtex.html>
% 樋口耕一さんによる nissya.bst <http://hey.to/KO-ichi>
%
% 等を参考にさせていただきました。これらの有益なプログラム、ページを作成し
% てくださった方々に感謝します。
%
% 元の jpolisci.bst の著作権は飯田さんにあります．
% わたしが改変した部分の著作権はどうでもいいです．好きなように扱ってください．
%
% オリジナルの jpolisci.bst は，
% <http://www.bol.ucla.edu/~oiida/jpolisci/> で入手することができます．
%
% コメント，要望は Shiro Takeda <zbc08106@park.zero.ad.jp> まで．
%

%%%% Changelog:

%%% Ver. 1.10 (Fri Dec 10, 2004)
% alphabet で yomi を記入しているケースで文献の順序がおかしくなるバグを修
% 正する。 

%%% Ver. 1.9 (Thu Oct  7, 2004)
% jauthor, jkanyaku のバグを直す。

%%% Ver. 1.8 (Thu Sep  2, 2004)
% バグをとる。
% \bysame を使うかどうか選択できるようにする。

%%% Ver. 1.7 (Tue Aug 31, 2004)
% バグをとる。
% カスタマイズしやすいように修正 → bst.xxx.yyy という形式の関数をたくさん導入。

%%% Sun Jul  4, 2004
% Referrence で同じ著者が続く場合には、名前を --- で省略するという形式に変更。
% これには樋口耕一さんによる nissya.bst を参考にさせていただきました。

%%% Sat Jun 26, 2004
% inproceedings でもページ数が出るように修正。
% その他細かい部分を修正。

%%% Tue Jan 14, 2003
%「、」を「，」に変えた．

%%% Fri Nov 15, 2002
% 誤植直した．
% 「版」の後に「、」が入るのを消した．
%  3 人以上の著者がいる文献を全員の名前を挙げて引用できるようにした．

%
% 以下は元の jpolisci.bst のヘッダー部分です．
%
%%%%%% ここから Original header.
%
% JPOLISCI: a bibliography style for papers in political sicence
%           and other fields that cite Japanese literature.
%           Vertical writing (tate-gaki) compatible.

	% Version 20000910 for JBibTeX versions 0.30 or later,
        % and pLaTeX2e or later.
	% Copyright (C) 2000, all rights reserved.
	%
	% This file was derived from jbtxbst.doc.
	%
	% Copying of this file is authorized only if either
	% (1) you make absolutely no changes to your copy, including name, or
	% (2) if you do make changes, you name it something other than
	% jbtxbst.doc, jplain.bst, junsrt.bst, jalpha.bst, jabbrv.bst,
	% tipsj.bst, jipsj.bst, tieice.bst, jname.bst, jorsj.bst, jglsj.bst,
        % seg.bst, jpolisci.bst.
	%
	% This restriction helps ensure that all standard styles are identical.
	% The file jbtxbst.doc has the documentation for this style.
	%

        % Author:
        %
        % 飯田修 Osamu Iida
        % email: oiida@newmail.net
        % URL  : http://www.bol.ucla.edu/~oiida/jpolisci/ (in Japanese)
        %
        % Bug reports, technical suggestions and any other comments
        % will be appreciated.
        % 

        % Acknowledgement:
        %
        % The following files were referred to while creating this file:
        %
        %   jglsj.bst  (by 千葉智章 Tomoaki Chiba)
        %     Function "format.lab.name" in jpolisci.bst derived from
        %     it with small modifications only. The author appreciates it.
        %
        %   seg.bst (by Martin Karrenbach)
        %     A method for making two sorts of labels is based on this
        %     file's feats.
        %
        %   jalpha.bst (by 松井正一 Shoichi Matsui)
        %     jpolisci.bst principally owes its functionality to it.
        %
        %   藤田眞作『続 LaTeX2e 階梯・縦組編』（アジソン・ウェスレイ、1998 年）。
        %
        % Friends in BBSes at IR-web <http://pws.prserv.net/oi/ -- now
        % obsolete> and KH's Web Site <http://home.att.ne.jp/wind/polisci/>
        % gave me titles of Japanese political science journals which are
        % included in MACROs.

        % This file is distributed with absolutely no warranty.
        % The author doesn't assume any kind of responsibility for
        % any inconvenience caused by using this file.

        % Last modified: 2000/12/05

%%%%%% Original header ここまで。
%

%%%%% From jfm.bst

% version 指定
FUNCTION {jecon.version}
{ "1.10" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%	カスタマイズのための関数
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \bysame を使うか否か。使わないなら 0、使うなら 0 以外を指定 (bst ファイ
% ルでは整数を表すとき数字に # を付ける)。
FUNCTION {bst.use.bysame}
% { #0 }	% Not use \bysame
{ #1 } 		% Use \bysame

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%	and

%%% 二人の authors, editors の間の文字列
%
% "Mr. A _ Mr. B " の "_" の部分に入る文字列
FUNCTION {bst.and}
{ " and " }

%%% 三人以上の authors, editors の間の文字列
%
% "Mr. A, Mr. B _ Mr. C" の "_" の部分に入る文字列
FUNCTION {bst.ands}
{ ", and " }

% 複数の authors, editors の間の文字列 (日本語文献用)
%
% "A 氏 _ B 氏 _ C 氏" の "_" の部分に入る文字列
FUNCTION {bst.and.jp}
{ "・" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	author 

% author の前に付ける文字列 (英語文献用)
FUNCTION {bst.author.pre}
{ "" }

% author の後に付ける文字列 (英語文献用)
FUNCTION {bst.author.post}
{ "" }

% author の前に付ける文字列 (日本語文献用)
FUNCTION {bst.author.pre.jp}
{ "" }

% author の後に付ける文字列 (日本語文献用)
FUNCTION {bst.author.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	year

% year の前に付ける文字列 (英語文献用)
FUNCTION {bst.year.pre}
{ " (" }

% year の後に付ける文字列 (英語文献用)
FUNCTION {bst.year.post}
{ ") " }

% year の前に付ける文字列 (日本語文献用)
FUNCTION {bst.year.pre.jp}
{ " (" }

% year の後に付ける文字列 (日本語文献用)
FUNCTION {bst.year.post.jp}
{ ") " }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	title (book 以外)

% title の前に付ける文字列 (英語文献用)
FUNCTION {bst.title.pre}
{ "``" }

% title の後に付ける文字列 (英語文献用)
FUNCTION {bst.title.post}
{ "''," }

% title の前に付ける文字列 (日本語文献用)
FUNCTION {bst.title.pre.jp}
{ "「" }

% title の後に付ける文字列 (日本語文献用)
FUNCTION {bst.title.post.jp}
{ "」，" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	book 用 title

% book の title 前に付ける文字列 (英語文献用)
FUNCTION {bst.book.pre}
{ " \textit{" }

% book の title 後に付ける文字列 (英語文献用)
FUNCTION {bst.book.post}
{ "}" }

% book の title 前に付ける文字列 (日本語文献用)
FUNCTION {bst.book.pre.jp}
{ " 『" }

% book の title 後に付ける文字列 (日本語文献用)
FUNCTION {bst.book.post.jp}
{ "』" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	booktitle

% booktitle の前に付ける文字列 (英語文献用)
FUNCTION {bst.btitle.pre}
{ " \textit{" }

% booktitle の後に付ける文字列 (英語文献用)
FUNCTION {bst.btitle.post}
{ "}" }

% booktitle の前に付ける文字列 (日本語文献用)
FUNCTION {bst.btitle.pre.jp}
{ "『" }

% booktitle の後に付ける文字列 (日本語文献用)
FUNCTION {bst.btitle.post.jp}
{ "』" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	journal name

% journal name の前に付ける文字列 (英語文献用)
FUNCTION {bst.journal.pre}
{ " \textit{" }

% journal name の後に付ける文字列 (英語文献用)
FUNCTION {bst.journal.post}
{ "}" }

% journal name の前に付ける文字列 (日本語文献用)
FUNCTION {bst.journal.pre.jp}
{ "『" }

% journal name の後に付ける文字列 (日本語文献用)
FUNCTION {bst.journal.post.jp}
{ "』" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	editor 記号

% 複数 editor を表す文字列 (英語文献用)
FUNCTION {bst.editors}
{ " eds. " }

% 一人の editor を表す文字列 (英語文献用)
FUNCTION {bst.editor}
{ " ed. " }

% editor を表す文字列 (日本語文献用)
FUNCTION {bst.editor.jp}
{ "（編）" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	edition

% edition の前に付ける文字列 (英語文献用)
FUNCTION {bst.edition.pre}
{ ", " }

% edition の後に付ける文字列 (英語文献用)
FUNCTION {bst.edition.post}
{ " edition" }

% edition の前に付ける文字列 (日本語文献用)
FUNCTION {bst.edition.pre.jp}
{ "，第" }

% edition の前に付ける文字列 (日本語文献用)
FUNCTION {bst.edition.post.jp}
{ "版" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	volume

% volume の前に付ける文字列 (英語文献用)
FUNCTION {bst.volume.pre}
{ ", Vol. " }

% volume の後に付ける文字列 (英語文献用)
FUNCTION {bst.volume.post}
{ "" }

% volume の前に付ける文字列 (日本語文献用)
FUNCTION {bst.volume.pre.jp}
{ "，第" }

% volume の後に付ける文字列 (日本語文献用)
FUNCTION {bst.volume.post.jp}
{ "巻" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	number

% number の前に付ける文字列 (英語文献用)
FUNCTION {bst.number.pre}
{ ", No. " }

% number の後に付ける文字列 (英語文献用)
FUNCTION {bst.number.post}
{ "" }

% number の前に付ける文字列 (日本語文献用)
FUNCTION {bst.number.pre.jp}
{ "，第" }

% number の後に付ける文字列 (日本語文献用)
FUNCTION {bst.number.post.jp}
{ "号" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	in 

% In (英語文献用)
FUNCTION {bst.in}
{ " in " }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	page

% page の前に付ける文字列 (複数ページ) (英語文献用)
FUNCTION {bst.pages.pre}
{ ", pp." }

% page の前に付ける文字列 (英語文献用)
FUNCTION {bst.page.pre}
{ ", p." }
% { ": " }

% page の後に付ける文字列 (複数ページ) (英語文献用)
FUNCTION {bst.pages.post}
{ "" }

% page の後に付ける文字列 (英語文献用)
FUNCTION {bst.page.post}
{ "" }

% page の前に付ける文字列 (日本語文献用)
FUNCTION {bst.page.pre.jp}
{ "，" }

% page の後に付ける文字列 (日本語文献用)
FUNCTION {bst.page.post.jp}
{ "頁" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	chapter

% chapter の前に付ける文字列 (英語文献用)
FUNCTION {bst.chapter.pre}
{ ", Chap." }

% chapter の後に付ける文字列 (英語文献用)
FUNCTION {bst.chapter.post}
{ "" }

% chapter の前に付ける文字列 (日本語文献用)
FUNCTION {bst.chapter.pre.jp}
{ "，第" }

% chapter の後に付ける文字列 (日本語文献用)
FUNCTION {bst.chapter.post.jp}
{ "章" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	month

% month の前に付ける文字列 (英語文献用)
FUNCTION {bst.month.pre}
{ ", " }

% month の後に付ける文字列 (英語文献用)
FUNCTION {bst.month.post}
{ "" }

% month の前に付ける文字列 (日本語文献用)
FUNCTION {bst.month.pre.jp}
{ "，" }

% month の後に付ける文字列 (日本語文献用)
FUNCTION {bst.month.post.jp}
{ "月" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	address
% address の前に付ける文字列 (英語文献用)
FUNCTION {bst.address.pre}
{ ", " }

% address の後に付ける文字列 (英語文献用)
FUNCTION {bst.address.post}
{ "" }

% address の前に付ける文字列 (日本語文献用)
FUNCTION {bst.address.pre.jp}
{ "，" }

% address の後に付ける文字列 (日本語文献用)
FUNCTION {bst.address.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	publisher

% publisher の前に付ける文字列 (英語文献用)
FUNCTION {bst.publisher.pre}
{ ": " }

% publisher の後に付ける文字列 (英語文献用)
FUNCTION {bst.publisher.post}
{ "" }

% publisher の前に付ける文字列 (日本語文献用)
FUNCTION {bst.publisher.pre.jp}
{ "，" }

% publisher の後に付ける文字列 (日本語文献用)
FUNCTION {bst.publisher.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	series

% series の前に付ける文字列 (英語文献用)
FUNCTION {bst.series.pre}
{ ", " }

% series の後に付ける文字列 (英語文献用)
FUNCTION {bst.series.post}
{ "" }

% series の前に付ける文字列 (日本語文献用)
FUNCTION {bst.series.pre.jp}
{ "，" }

% series の後に付ける文字列 (日本語文献用)
FUNCTION {bst.series.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	organization

% organization の前に付ける文字列 (英語文献用)
FUNCTION {bst.organization.pre}
{ ", " }

% organization の後に付ける文字列 (英語文献用)
FUNCTION {bst.organization.post}
{ "" }

% organization の前に付ける文字列 (日本語文献用)
FUNCTION {bst.organization.pre.jp}
{ "，" }

% organization の後に付ける文字列 (日本語文献用)
FUNCTION {bst.organization.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	school

% school の前に付ける文字列 (英語文献用)
FUNCTION {bst.school.pre}
{ ", " }

% school の後に付ける文字列 (英語文献用)
FUNCTION {bst.school.post}
{ "" }

% school の前に付ける文字列 (日本語文献用)
FUNCTION {bst.school.pre.jp}
{ "，" }

% school の後に付ける文字列 (日本語文献用)
FUNCTION {bst.school.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	institution

% institution の前に付ける文字列 (英語文献用)
FUNCTION {bst.institution.pre}
{ ", " }

% institution の後に付ける文字列 (英語文献用)
FUNCTION {bst.institution.post}
{ "" }

% institution の前に付ける文字列 (日本語文献用)
FUNCTION {bst.institution.pre.jp}
{ "，" }

% institution の後に付ける文字列 (日本語文献用)
FUNCTION {bst.institution.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	howpublished

% howpublished の前に付ける文字列 (英語文献用)
FUNCTION {bst.howpublished.pre}
{ " " }

% howpublished の後に付ける文字列 (英語文献用)
FUNCTION {bst.howpublished.post}
{ "" }

% howpublished の前に付ける文字列 (日本語文献用)
FUNCTION {bst.howpublished.pre.jp}
{ "，" }

% howpublished の後に付ける文字列 (日本語文献用)
FUNCTION {bst.howpublished.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	その他の関数

% Technical report を表す文字列 (英語文献用)
FUNCTION {bst.techrep}
{ " Tech. Rep." }

% Technical report を表す文字列 (日本語文献用)
FUNCTION {bst.techrep.jp}
{ " テクニカル・レポート" }

% master thesis を表す文字列 (英語文献用)
FUNCTION {bst.mthesis}
{ " Master's thesis" }

% master thesis を表す文字列 (日本語文献用)
FUNCTION {bst.mthesis.jp}
{ "修士論文" }

% phd thesis を表す文字列 (英語文献用)
FUNCTION {bst.phdthesis}
{ " Ph. D. dissertation" }

% phd thesis を表す文字列 (日本語文献用)
FUNCTION {bst.phdthesis.jp}
{ "博士論文" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%	カスタマイズのための関数はここまで。
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% 以下は英語文献用
FUNCTION {bst.first}
{ "1st" }

FUNCTION {bst.second}
{ "2nd" }

FUNCTION {bst.third}
{ "3rd" }

FUNCTION {bst.fourth}
{ "4th" }

FUNCTION {bst.fifth}
{ "5th" }

FUNCTION {bst.st}
{ "st" }

FUNCTION {bst.nd}
{ "nd" }

FUNCTION {bst.rd}
{ "rd" }

FUNCTION {bst.th}
{ "th" }

%%% メモ by Takeda

% "a" 'b := は b という変数に "a" という文字列を代入するということ。

% #0 は整数の 0、#1 は整数の 1．．．を表す。

% 関数の書式
%
% FUNCTION {name}
% { 's :=
%
% }
%
% 上は name という関数の定義。呼出し側では
%
% "hoge" name
%
% という形で指定。"hoge" という文字列が、変数 s に代入される。

ENTRY { address author booktitle chapter edition editor howpublished
  institution journal key month note number organization pages publisher
  school series title type volume year yomi
  jauthor jkanyaku jtitle jpublisher jyear }

  { is.kanji.entry field.used }

  { label cyear flabel alabel extra.label sort.label sort.flabel
    sort.alabel sort.cyear list.year extra.label.bysame}

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

%%% period を付ける関数 (英語文献用)
FUNCTION {add.period.x}
{
  duplicate$
  #-1 #1 substring$ "," =
    { #-2 global.max$ substring$ "." * }
    { duplicate$
      #-1 #2 substring$ ",'" =
        { #-3 global.max$ substring$ ".'" * }
	{ duplicate$
	  #-1 #3 substring$ ",''" =
	    { #-4 global.max$ substring$ ".''" * }
	    { add.period$ }
	  if$
	}
     if$
   }
  if$
}

%%% period を付ける関数 (日本語文献用)
FUNCTION {add.kanji.period.x}
{
  duplicate$
  #-1 #1 substring$ "，" =
    { #-2 global.max$ substring$ "．" * }
    { duplicate$
      #-1 #1 substring$ "、" =
        { #-2 global.max$ substring$ "．" * }
        { duplicate$
          #-1 #1 substring$ "." =
            {#-2 global.max$ substring$ "．" * }
	    {#-1 global.max$ substring$ "．" * }
          if$
        }
     if$
   }
  if$
}

%%% output.nonnull は文中なら前に ","、「，」を付ける。
FUNCTION {output.nonnull}
{ 's :=
  % mid.sentence のとき
  output.state mid.sentence =
    { is.kanji.entry
        { "，" * write$ }
        { ", " * write$ }
      if$
    }
    % mid.sentence ではないとき
    { output.state after.block =
        % after.block のとき
	{ is.kanji.entry
            { add.kanji.period.x write$}
	    { add.period.x " " * write$ }
	  if$
	}
	% before.all のとき
	{ output.state before.all =
	    'write$
	    { is.kanji.entry
 		{ add.kanji.period.x write$ }
		{ add.period.x " " * write$ }
	      if$
	    }
	  if$
	}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

%%% output.nonnull.nocomma は文中でも前に ","、「，」を付けない。
FUNCTION {output.nonnull.nocomma}
{ 's :=
  % mid.sentence のとき
  output.state mid.sentence =
    { is.kanji.entry
        { "" * write$ }
        { "" * write$ }
      if$
    }
    % mid.sentence ではないとき
    { output.state after.block =
        % after.block のとき
	{ is.kanji.entry
            { add.kanji.period.x write$}
	    { add.period.x " " * write$ }
	  if$
	}
	% before.all のとき
	{ output.state before.all =
	    'write$
	    { is.kanji.entry
 		{ add.kanji.period.x write$ }
		{ add.period$ " " * write$ }
	      if$
	    }
	  if$
	}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.nocomma}
{ duplicate$ empty$
    'pop$
    'output.nonnull.nocomma
  if$
}

%%% output.check ではエントリーが空なら warning が出力される。前に , が付く。
FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

%%% output.check ではエントリーが空なら warning が出力される。前に , が付かない。
FUNCTION {output.check.nocomma}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull.nocomma
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% bbl ファイルへの出力の形式

% \harvarditem[Brezis et~al.]{Brezis, Krugman and
%   Tsiddon}{1993}{brezis93:_leapf_inter_compet}
% Brezis, Elise~S., Paul~R. Krugman, and Daniel Tsiddon  (1993) ``Leapfrogging in
%   International Competition: A Theory of Cycles in National Technological
%   Leadership.'', {\em American Economic Review.}, Vol.~83. No.~5. pp.
%   1211--1219.

% \harvarditem[abbreviated citation]{full citation}{year}{keyword} ...
%
% という形式で出力する。

FUNCTION {output.bibitem}
{ newline$
  "\harvarditem[" write$
  alabel write$			% alabel が abbreviated citation
  "]{" write$
  flabel write$			% flabel が full citation
  "}{" write$
  cyear write$			% cyear が year
  "}{" write$
  cite$ write$			% cite$ で keyword がプッシュされる。
  "}" write$

  newline$
  ""
  before.all 'output.state :=
}

%%% エントリーの最後。period を付けて、改行。
FUNCTION {fin.entry}
{ is.kanji.entry
    { add.kanji.period.x }
    { add.period.x }
  if$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
	'skip$
	{ after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

%%% booktitle の整形。
FUNCTION {format.btitle}
{ booktitle empty$
    { "" }
    { booktitle is.kanji.str$
	{ bst.btitle.pre.jp booktitle * bst.btitle.post.jp * }
	{ bst.btitle.pre booktitle * bst.btitle.post * }
      if$
    }
  if$
}

%%% journal の整形。
FUNCTION {format.journal}
{ journal empty$
    { "" }
    { journal is.kanji.str$
	{ bst.journal.pre.jp journal * bst.journal.post.jp * }
 	{ bst.journal.pre journal * bst.journal.post * }
      if$
    }
  if$
}

%%% book の title の整形。
FUNCTION {format.book}
{ title empty$
    { "" }
    { title is.kanji.str$
	{ bst.book.pre.jp title * bst.book.post.jp * }
 	{ bst.book.pre title * bst.book.post * }
      if$
    }
  if$
}

%%% author, editor の処理
INTEGERS { nameptr namesleft numnames }
FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{ff}{ll}" format.name$ is.kanji.str$
	{ s nameptr "{ff}{ll}" format.name$ 't := }
        { nameptr #1 =
	  { s is.kanji.str$
 	      { s nameptr "{ff}{ll}" format.name$ 't := }
   	      { s nameptr "{vv~}{ll}{, ff}{, jj}" format.name$ 't := }
	    if$
	  }
          { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
         if$
        }
      if$
      nameptr #1 >
	{ namesleft #1 >
 	    { s is.kanji.str$
 		{ bst.and.jp  * t * }
 		{ ", " * t * }
	      if$
	    }
	    { t "others" =
  		{ s is.kanji.str$
  			{ "他" * }
 			{ " et~al." * }
 		  if$
 		}
  		{ s is.kanji.str$
 		    { bst.and.jp * t * }
		    { numnames #2 =
  			{ bst.and * t * }
  			{ bst.ands * t * }
		      if$
		    }
 		   if$
 		}
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.names.full}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{ff}{ll}" format.name$ is.kanji.str$
	{ s nameptr "{ff}{ll}" format.name$ 't := }
        { nameptr #1 =
 	  { s nameptr "{vv~}{ll}{, ff}{, jj}" format.name$ 't := }
          { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
         if$
        }
      if$
      nameptr #1 >
	{ namesleft #1 >
 	    { s is.kanji.str$
		{ bst.and.jp * t * }
		{ ", " * t * }
	      if$
	    }
	    { t "others" =
  		{ s is.kanji.str$
  			{ "他" * }
 			{ " et~al." * }
 		  if$
 		}
  		{ s is.kanji.str$
 		    { bst.and.jp * t * }
		    { numnames #2 =
 			{ bst.and * t * }
 			{ bst.ands * t * }
		      if$
		    }
 		   if$
 		}
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.editornames}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{ff}{ll}" format.name$ is.kanji.str$
	{ s nameptr "{ff}{ll}" format.name$ 't := }
        { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
      if$
      nameptr #1 >
        % editor が二人以上
	{ namesleft #1 >
 	    { s is.kanji.str$
		{ bst.and.jp * t * }
		{ ", " * t * }
	      if$
	    }
	    { t "others" =
  		{ s is.kanji.str$
  			{ "他" * }
 			{ " et~al." * }
 		  if$
 		}
  		{ s is.kanji.str$
 		    { bst.and.jp * t * }
		    { numnames #2 =
 			{ bst.and  * t * }
 			{ bst.ands * t * }
		      if$
		    }
 		   if$
 		}
	      if$
	    }
	  if$
	}
 	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { extra.label.bysame "bysame" =
	{"\bysame "}
 	{ author is.kanji.str$
 	    { bst.author.pre.jp author format.names * bst.author.post.jp * }
   	    { bst.author.pre author format.names * bst.author.post * }
	  if$
	}
      if$
    }
  if$
}

INTEGERS {bysame.check}
FUNCTION {format.editors}
{ editor empty$
    { "" }
    { extra.label.bysame "bysame" =
	{ #1 'bysame.check :=
	   "\bysame " }
	{ editor is.kanji.str$
	    { bst.author.pre.jp editor format.names * bst.author.post.jp * }
 	    { bst.author.pre editor format.names * bst.author.post * }
	  if$
	}
      if$
      #1 bysame.check =
        { "" * }
        { editor num.names$ #1 >
 	  { editor is.kanji.str$
              { bst.editor.jp * }
	      { bst.editors * }
	    if$
 	  }
  	  { editor is.kanji.str$
 	      { bst.editor.jp * }
	      { bst.editor * }
	    if$
 	  }
        if$
        }
      if$
    }
  if$
}

%%% format.in.ed.booktitle 用
FUNCTION {format.editors.x}
{ editor empty$
    { "" }
    { editor format.editornames
      editor num.names$ #1 >
 	{ editor is.kanji.str$
 		{ bst.editor.jp * }
		{ bst.editors * }
	  if$
 	}
  	{ editor is.kanji.str$
 		{ bst.editor.jp * }
		{ bst.editor * }
	  if$
 	}
      if$
    }
  if$
}

%%% 「?.」、「?,」のようなケースで、period、comma を除去
FUNCTION {remove.irrelevant.period.comma}
{ 's :=
  s empty$
    { "" }
    { s #-1 #3 substring$ "?,'" =
      s #-1 #3 substring$ "?.'" =
      or
        { s #-3 global.max$ substring$ "'" * }
	{ s #-1 #4 substring$ "?,''" =
          s #-1 #4 substring$ "?.''" =
          or
            { s #-4 global.max$ substring$ "''" * }
	    { s #-1 #2 substring$ "?," =
              s #-1 #2 substring$ "?." =
	      or
                { s #-2 global.max$ substring$ "" * }
                's
	      if$
            }
          if$
        }
      if$
    }
  if$
}

%%% 最初についている comma を除去した文字列を返す。
FUNCTION {remove.pre.comma}
{ 's :=
  s empty$
    { "" }
    { s #1 #1 substring$ "," = 
       { s #2 global.max$ substring$ }
       { s #1 #2 substring$ "，" = s #1 #2 substring$ "、" = or
          { s #3 global.max$ substring$ }
          's
         if$
       }
      if$
    }
  if$
}

% FUNCTION {remove.pre.comma}
% { 's :=
%   s empty$
%     { "" }
%     { s #1 #1 substring$ "," = 
%        { s #2 global.max$ substring$ }
%        's
%       if$
%     }
% %        'skip$
%   if$
% }

FUNCTION {format.title.sub}
{ bst.title.pre title * bst.title.post * }

%%% title の処理
FUNCTION {format.title}
{ title empty$
    { "" }
    { title is.kanji.str$
      { bst.title.pre.jp title * bst.title.post.jp * }
      { format.title.sub remove.irrelevant.period.comma }
     if$
    }
  if$
}

%%% jtitle の処理
FUNCTION {format.jtitle}
{ jtitle empty$
    { "" }
    { bst.book.pre.jp jtitle * bst.book.post.jp * }
  if$
}

%%% misc の title の処理
FUNCTION {format.misc.title}
{ title empty$
    { "" }
    { title is.kanji.str$
      { bst.title.pre.jp title * bst.title.post.jp * }
      { bst.title.pre title * bst.title.post * }
     if$
    }
  if$
}

% - を -- にする関数 (pages 用)
FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
	{ t #1 #2 substring$ "--" = not
	    { "--" *
	      t #2 global.max$ substring$ 't :=
	    }
	    {   { t #1 #1 substring$ "-" = }
		{ "-" *
		  t #2 global.max$ substring$ 't :=
		}
	      while$
	    }
	  if$
	}
	{ t #1 #1 substring$ is.kanji.str$
	  { t #1 #2 substring$ *
	    t #3 global.max$ substring$ 't :=
	  }

	  { t #1 #1 substring$ *
	    t #2 global.max$ substring$ 't :=
	  }
	  if$
	}
      if$
    }
  while$
}

%%% year の処理
FUNCTION {format.year}
{ year empty$
    { "there's no year or yyear in " cite$ * warning$
      "" }
    { year is.kanji.str$
        { bst.year.pre.jp year * extra.label * bst.year.post.jp * }
        { bst.year.pre year * extra.label * bst.year.post * }
      if$
    }
  if$
}

%%% book の page の処理
FUNCTION {format.book.pages}
{ pages empty$
    { "" }
    { is.kanji.entry
        { bst.page.pre.jp pages * bst.page.post.jp * }
        { bst.pages.pre pages * bst.pages.post * }
      if$
    }
  if$
}

%%% ?
FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { is.kanji.entry
	{ bst.volume.pre.jp volume * bst.volume.post.jp * }
        { bst.volume.pre volume * bst.volume.post * }
      if$
      series empty$
	'skip$
	%% series もあるとき
	{ is.kanji.entry
	    { bst.series.pre.jp * series * bst.series.post.jp * }
	    { " of " * series * bst.series.post * }
	  if$
	}
      if$
      "volume and number" number either.or.check
    }
  if$
}

%%% series の出力
FUNCTION {output.series}
{ series empty$
    { "" }
    { is.kanji.entry
        { bst.series.pre.jp series * bst.series.post.jp * }
        { bst.series.pre series * bst.series.post * }
      if$
    }
 if$
}

%%% number と series を出力
FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        % number is empty
   	{ series empty$
	    { "" }
	    % series is not empty.
	    { output.series
	      "there's a number but no series in " cite$ * warning$ }
	  if$
	}
        % number is not empty$
	{ series empty$
	    { is.kanji.entry
	        { bst.number.pre.jp number * bst.number.post.jp * }
		{ bst.number.pre number * bst.number.post * }
	      if$
	    }
	    % series is not empty.  日本語と英語で順序逆にする。
	    { is.kanji.entry
 	        { bst.series.pre.jp series * bst.series.post.jp *
		  bst.number.pre.jp * number * bst.number.post.jp * }
		{ bst.in bst.series.pre * series * bst.series.post *
		  bst.number.pre * number * bst.number.post * }
	      if$
	    }
	  if$
	}
      if$
    }
    { "" }
  if$
}

FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {extract.num}
{ duplicate$ 't :=
  "" 's :=
  { t empty$ not }
  { t #1 #1 substring$
    t #2 global.max$ substring$ 't :=
    duplicate$ is.num
      { s swap$ * 's := }
      { pop$ "" 't := }
    if$
  }
  while$
  s empty$
    'skip$
    { pop$ s }
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	edition 処理用のプログラム

% 英語の edition は全て 1st, 2nd, 3rd, 4th etc. に変換する。

FUNCTION {eng.ord}
{ duplicate$ "1" swap$ *
  #-2 #1 substring$ "1" =
     { bst.th * }
     { duplicate$ #-1 #1 substring$
       duplicate$ "1" =
         { pop$ bst.st * }
         { duplicate$ "2" =
             { pop$ bst.nd * }
             { "3" =
                 { bst.rd * }
                 { bst.th * }
               if$
             }
           if$
          }
       if$
     }
   if$
}

% edition entry の first, second 等を 1st, 2nd に変換する (from jfm.bst)。
FUNCTION {convert.edition}
{ edition extract.num "l" change.case$ 's :=
  s "first" = s "1" = or
    { bst.first 't := }
    { s "second" = s "2" = or
        { bst.second 't := }
        { s "third" = s "3" = or
            { bst.third 't := }
            { s "fourth" = s "4" = or
                { bst.fourth 't := }
                { s "fifth" = s "5" = or
                    { bst.fifth 't := }
                    { s #1 #1 substring$ is.num
                        { s eng.ord 't := }
                        { edition 't := }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
  t
}

% 日本語文献の場合には月を数字に変換する。
FUNCTION {convert.month}
{ is.kanji.entry
    { month "January" =
        { "1" 't := }
        { month "February" =
            { "2" 't := }
            { month "March" =
                { "3" 't := }
                { month "April" =
                    { "4" 't := }
                    { month "May" =
                        { "5" 't := }
                        { month "June" =
                            { "6" 't := }
                            { month "July" =
                                { "7" 't := }
                                { month "August" =
                                    { "8" 't := }
                                    { month "September" =
                                        { "9" 't := }
                                        { month "October" =
                                            { "10" 't := }
                                            { month "November" =
                                                { "11" 't := }
                                                { month "December" =
                                                    { "12" 't := }
                                                    { month 't := }
                                                if$
                                                }
                                            if$
                                            }
                                        if$
                                        }
                                    if$
                                    }
                                if$
                                }
                            if$
                            }
                        if$
                        }
                    if$
                    }
                if$
                }
            if$
            }
        if$
        }
    if$
    }
    { month 't := }
  if$
  t
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { is.kanji.entry
	{ bst.edition.pre.jp edition * bst.edition.post.jp * }
        { output.state mid.sentence =
            { bst.edition.pre convert.edition "l" change.case$ * bst.edition.post * }
            { bst.edition.pre convert.edition "t" change.case$ * bst.edition.post * }
          if$
        }
      if$
    }
  if$
}

%%% month の整形。
FUNCTION {format.month}
{ month empty$
    { "" }
    { is.kanji.entry
        { bst.month.pre.jp convert.month * bst.month.post.jp * }
        { bst.month.pre convert.month * bst.month.post * }
      if$
    }
  if$
}

INTEGERS { multiresult }
FUNCTION { multi.page.check }
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
	{ #1 'multiresult := }
	{ t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

%%% pages の整形。
FUNCTION {format.pages}
{ pages empty$
    { "" }
    { is.kanji.entry
        { pages multi.page.check
          { bst.page.pre.jp pages n.dashify * bst.page.post.jp * }
          { bst.page.pre.jp pages * bst.page.post.jp * }
         if$
        }
        { pages multi.page.check
 	  { bst.pages.pre pages n.dashify tie.or.space.connect * bst.pages.post }
	  { bst.page.pre pages tie.or.space.connect * bst.page.post }
         if$
        }
       if$
   }
 if$
}

%%% number を整形
FUNCTION {format.number}
{ number empty$
    'skip$
    { is.kanji.entry
        { bst.number.pre.jp number * bst.number.post.jp * }
	{ bst.number.pre number * bst.number.post * }
      if$
    }
  if$
}

%%% volume を整形
FUNCTION {format.volume}
{ volume empty$
    'skip$
    { is.kanji.entry
        { bst.volume.pre.jp volume * bst.volume.post.jp * }
	{ bst.volume.pre volume * bst.volume.post * }
      if$
    }
  if$
}

%%% number、page を出力
FUNCTION {format.number.pages}
{ format.number format.pages * }

%%% volume、page を出力
FUNCTION {format.volume.pages}
{ format.volume format.pages * }

%%% volume、number、page を出力
FUNCTION {format.volume.number.pages}
{ format.volume format.number * format.pages * }

% volume, number, page を一緒に処理する関数。
FUNCTION {format.vol.num.pages}
{ volume empty$
    %% volume is empty.
    { number empty$
        %% number is empty.
        { pages empty$
	    % この場合は warning を出す。
            { "there is no volume, number, and pages in " cite$ * warning$ "" }	
	    { "" format.pages * }
         if$
        }
        %% number is not empty.
	% この場合は warning を出す。
	{ "there's a number but no volume in " cite$ * warning$
	  format.number.pages }
     if$
    }
    %% volume is not empty.
    { number empty$
        %% number is empty.
	{ format.volume.pages }
        %% number is not empty.
	{ format.volume.number.pages }
     if$
    }
  if$
}

%%% chapter の整形。
FUNCTION {format.chapter}
{ chapter empty$
    { "" }
    { is.kanji.entry
	{ bst.chapter.pre.jp chapter * bst.chapter.post.jp * }
 	{ bst.chapter.pre chapter tie.or.space.connect * bst.chapter.post }
      if$
    }
  if$
}

%%% chapter, pages を一緒に処理する関数
FUNCTION {format.chapter.pages}
{ chapter empty$
    { pages empty$
        { "" }
	{ "" format.pages * }
      if$
    }
    { pages empty$
        { "" format.chapter * }
        { "" format.chapter * format.pages * }
      if$
    }
  if$
}

%%% editor and booktitle の整形。
FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
 	{ is.kanji.entry
    	    { format.btitle remove.pre.comma }
   	    { bst.in format.btitle * }
 	  if$
 	}
 	{ is.kanji.entry
  	    { format.editors.x "" * format.btitle * }
    	    { bst.in format.editors.x * " " * format.btitle * }
 	  if$
 	}
      if$
    }
  if$
}

%%% howpublished の整形。
FUNCTION {format.howpublished}
{ howpublished empty$
    { "" }
    { is.kanji.entry
        { bst.howpublished.pre.jp howpublished * bst.howpublished.post.jp * }
        { bst.howpublished.pre howpublished * bst.howpublished.post * }
      if$
    }
  if$
}

%%% address の整形。
FUNCTION {format.address}
{ address empty$
    { "" }
    { address is.kanji.str$
        { bst.address.pre.jp address * bst.address.post.jp * }
        { bst.address.pre address * bst.address.post * }
      if$
    }
  if$
}

%%% publisher の整形。
FUNCTION {format.publisher}
{ publisher empty$
    { "" }
    { is.kanji.entry 
        { bst.publisher.pre.jp publisher * bst.publisher.post.jp * }
	{ bst.publisher.pre publisher * bst.publisher.post * }
      if$
    }
  if$
}

%%% organization の整形。
FUNCTION {format.organization}
{ organization empty$
    { "" }
    { is.kanji.entry
        { bst.organization.pre.jp organization * bst.organization.post.jp * }
	{ bst.organization.pre organization * bst.organization.post * }
      if$
    }
  if$
}

%% publisher と address を出力する関数
FUNCTION {output.publisher.address}
{ address empty$
    { format.publisher "publisher" output.check.nocomma }
    % 日本語、英語で publisher と address の順序が逆
    { is.kanji.entry
	{ format.publisher "publisher" output.check.nocomma
	  format.address output.nocomma }
	{ format.address output.nocomma
	  format.publisher "publisher" output.check.nocomma }
      if$
    }
  if$
}

%% address, organization, publisher を出力する関数
FUNCTION {output.address.organization.publisher}
{ address empty$
    %% address is empty
    { organization empty$
        %% organization is empty
        { publisher empty$
	    'skip$
	    { format.publisher "publisher" output.check.nocomma }
	  if$
        }
        %% organization is not empty
        { publisher empty$
	    { format.organization "organization" output.check.nocomma }
	    { format.organization "organization" output.check.nocomma
	      format.publisher "publisher" output.check.nocomma }
	  if$
        }
     if$
    }
    %% address is not empty
    { organization empty$
        %% organization is empty
        { publisher empty$
	    %% publisher is empty
	    { format.address output.nocomma }
	    %% publisher is not empty
	    { is.kanji.entry
	        { format.publisher "publisher" output.check.nocomma
		  format.address output.nocomma }
		{ format.address output.nocomma
		  format.publisher "publisher" output.check.nocomma }
	      if$
	    }
	 if$
        }
        %% organization is not empty
        { publisher empty$
	    %% publisher is empty
	    { format.organization "organization" output.check.nocomma
	      format.address output.nocomma }
	    %% publisher is not empty
	    { is.kanji.entry
	        { format.organization "organization" output.check.nocomma
		  format.publisher "publisher" output.check.nocomma
		  format.address output.nocomma }
		{ format.organization "organization" output.check.nocomma
		  format.address output.nocomma
		  format.publisher "publisher" output.check.nocomma }
	      if$
	    }
	 if$
        }
     if$
    }
  if$
}

%%% ?
FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Technical Report" }
    { " " type * }
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
	{ "need key or journal for " cite$ * " to crossref " * crossref *
	  warning$
	  ""
	}
  	{ journal is.kanji.str$
 	    { bst.journal.pre.jp journal * bst.journal.post.jp *  }
  	    { bst.in bst.journal.pre * journal * bst.journal.post * }
          if$
	}
      if$
    }
    { title is.kanji.str$
 	{ " \cite{" crossref * "}" * }
  	{ bst.in " \cite{" * crossref * "}" * }
      if$
    }
  if$
}

FUNCTION {format.crossref.editor}
{ editor is.kanji.str$
     { editor #1 "{ff}" format.name$ duplicate$
      empty$
 	{ pop$ editor #1 "{ll}" format.name$ }
 	'skip$
      if$
      }
      { editor #1 "{vv~}{ll}" format.name$ }
  if$
  editor num.names$ duplicate$
  #2 >
    { editor is.kanji.str$
 	{ pop$ "他" * }
	{ pop$ " et~al." * }
	if$
    }
    { #2 <
	'skip$
	{ editor #2 "{ff~}{vv~}{ll}{, jj}" format.name$ "others" =
 	    { editor is.kanji.str$
  		{ "他" *}
		{ " et~al." * }
	      if$
  	    }
 	    { editor is.kanji.str$
 		{ "，" *
 		  editor #2 "{ff}" format.name$ duplicate$
 		  empty$
 			{ pop$ editor #2 "{ll}" format.name$ }
 			'skip$
 		  if$
 		 *
 		}
 		{ " and " * editor #2 "{vv~}{ll}" format.name$ * }
 	      if$
 	    }
	  if$
	}
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
       title is.kanji.str$
 	 { "  " }
	 { bst.in }
       if$
    }
    { volume is.kanji.str$
	{ volume }
	{ is.kanji.entry
	    { bst.volume.pre.jp  volume * bst.volume.post.jp * }
	    { bst.volume.pre volume * bst.volume.post " of " *  }
	  if$
	}
      if$
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
	{ series empty$
	    { "need editor, key, or series for " cite$ * " to crossref " *
	      crossref * warning$
	      "" *
	    }
	    { title is.kanji.str$
		{ bst.btitle.pre.jp series * bst.btitle.post.jp * swap$ * }
	        { bst.btitle.pre * series * bst.btitle.post * }
	      if$
	    }
	  if$
	}
	{ key * }
      if$
    }
    { format.crossref.editor * }
  if$
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
	{ booktitle empty$
	    { "need editor, key, or booktitle for " cite$ * " to crossref " *
	      crossref * warning$
	      ""
	    }
 	    { booktitle is.kanji.str$
 		{ format.btitle }
 		{ "In {\em " booktitle * "\/}" * }
 	       if$
 	    }
	  if$
	}
	{ bst.in key * }
      if$
    }
    { title is.kanji.str$
 	{ " \cite{" crossref * "}" * }
 	{ bst.in " \cite{" * crossref * "}" * }
%   	{ bst.in format.crossref.editor * }
%   	{ bst.in format.crossref.editor * }
      if$
    }
  if$
}

%%% phdthesis の整形
FUNCTION {format.phd}
{ is.kanji.entry
    { bst.phdthesis.jp }
    { bst.phdthesis }
   if$
}

%%% school の整形
FUNCTION {format.school}
{ school empty$
    { "" }
    { is.kanji.entry
        { bst.school.pre.jp school * bst.school.post.jp * }
        { bst.school.pre school * bst.school.post * }
      if$
    }
  if$
}

%%% institution の整形
FUNCTION {format.institution}
{ institution empty$
    { "" }
    { is.kanji.entry
        { bst.institution.pre.jp institution * bst.institution.post.jp * }
	{ bst.institution.pre institution * bst.institution.post * }
      if$
    }
  if$
}  

%%% hoyakusho の整形
FUNCTION {format.hoyakusho}
{ jauthor empty$
  jkanyaku empty$
  jtitle empty$
  jpublisher empty$
  jyear empty$
  and and and and
    { "" }
    { add.period$
      jauthor empty$
        { jkanyaku empty$
            { "" * }
            { jkanyaku format.names "監訳" * "，" * }
          if$
        }
        { jauthor format.names "訳" * "，" * }
      if$
      jtitle empty$
        { "" * }
        { format.jtitle * "，" * }
      if$
      jpublisher empty$
        { "" * }
        { jpublisher * "，" * }
      if$
      jyear empty$
        { "" * }
        { "" * jyear * "年" * }
      if$
      "（" swap$ * "）" *
    }
 if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	 article の処理

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check.nocomma
  format.year "year" output.check.nocomma
  format.title "title" output.check.nocomma
  crossref missing$
    { format.journal "journal" output.check.nocomma
      format.vol.num.pages output.nocomma
    }
    { format.article.crossref output.nonnull.nocomma
      format.pages output.nocomma
    }
  if$
  format.month output.nocomma
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	 book の処理

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check.nocomma }
    { format.authors output.nonnull.nocomma
      crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$
  format.year "year"  output.check.nocomma
  format.book "title" output.check.nocomma
  crossref missing$
    { 
      format.bvolume output.nocomma
      format.number.series output.nocomma
      output.publisher.address
    }
    { format.book.crossref output.nonnull.nocomma
    }
  if$

  format.edition output.nocomma
  format.book.pages output.nocomma
  format.hoyakusho output.nocomma
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	 booklet の処理

FUNCTION {booklet}
{ output.bibitem
  format.authors output.nocomma
  format.year output.nocomma
  format.misc.title "title" output.check.nocomma
  format.howpublished output.nocomma
  format.address output.nocomma
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	inbook の処理

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check.nocomma }
    { format.authors output.nonnull.nocomma
      crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$
  format.year "year" output.check.nocomma
  format.book remove.pre.comma "title" output.check.nocomma
  format.edition output.nocomma
  crossref missing$
    { format.bvolume output.nocomma
      format.chapter.pages "chapter and pages" output.check.nocomma
      format.number.series output.nocomma
      output.publisher.address
    }
    { 
      format.chapter.pages "chapter and pages" output.check.nocomma
      format.book.crossref output.nonnull.nocomma
    }
  if$
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	incollection の処理

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check.nocomma
  format.year "year"  output.check.nocomma
  format.title "title" output.check.nocomma
  crossref missing$
    { 
      format.in.ed.booktitle "booktitle" output.check.nocomma
      format.bvolume output.nocomma
      output.address.organization.publisher
      format.edition output.nocomma
      format.chapter.pages output.nocomma
    }
    { format.incoll.inproc.crossref output.nonnull.nocomma
      format.chapter.pages output.nocomma
    }
  if$
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	inproceedings の処理

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check.nocomma
  format.year "year"  output.check.nocomma
  format.title "title" output.check.nocomma
  crossref missing$
    { 
      format.in.ed.booktitle "booktitle" output.check.nocomma
      format.bvolume output.nocomma
      format.number.series output.nocomma
      format.pages output.nocomma
      output.address.organization.publisher
    }
    {
      format.incoll.inproc.crossref output.nonnull.nocomma
      format.pages output.nocomma
    }
  if$
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	conference の処理

FUNCTION {conference}
{ inproceedings }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	manual の処理

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
	'skip$
	{ organization output.nonnull.nocomma
	  address output.nocomma
	}
      if$
    }
    { format.authors output.nonnull.nocomma }
  if$
  format.year "year" output.check.nocomma
  format.book "title" output.check.nocomma
  author empty$
    { organization empty$
	{ format.address new.block.checka
	  format.address output.nocomma
	}
	'skip$
      if$
    }
    { output.address.organization.publisher }
  if$
  format.edition output.nocomma
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	mastersthesis の処理

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check.nocomma
  format.year "year"  output.check.nocomma
  format.title "title" output.check.nocomma
  "Master's thesis" format.thesis.type output.nonnull.nocomma
  format.school "school" output.check.nocomma
  format.address output.nocomma
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	misc の処理

FUNCTION {misc}
{ output.bibitem
  format.authors output.nocomma
  format.year output.nocomma
  format.misc.title output.nocomma
  format.howpublished output.nocomma
  new.block
  note output.nocomma
  fin.entry
  empty.misc.check
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	phdthesis の処理

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check.nocomma
  format.year "year"  output.check.nocomma
  format.title "title" output.check.nocomma
  format.phd
  format.thesis.type output.nonnull.nocomma
  format.school "school" output.check.nocomma
  address empty$
    'skip$
    { format.address output.nocomma }
  if$
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	proceedings の処理

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output.nocomma }
    { format.editors output.nonnull.nocomma }
  if$
  format.year "year" output.check.nocomma
  format.btitle remove.pre.comma "title" output.check.nocomma
  format.bvolume output.nocomma
  format.number.series output.nocomma
  output.address.organization.publisher
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	techreport の処理

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check.nocomma
  format.year "year"  output.check.nocomma
  format.title "title" output.check.nocomma
  format.tr.number output.nonnull.nocomma
  format.institution "institution" output.check.nocomma
  format.address output.nocomma
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	unpublished の処理

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check.nocomma
  format.year output.nocomma
  format.title "title" output.check.nocomma
  format.month remove.pre.comma output.nocomma
  new.block
  note "note" output.check.nocomma
  fin.entry
}

FUNCTION {default.type}
{ misc }

MACRO {jan} {"January"}
MACRO {feb} {"February"}
MACRO {mar} {"March"}
MACRO {apr} {"April"}
MACRO {may} {"May"}
MACRO {jun} {"June"}
MACRO {jul} {"July"}
MACRO {aug} {"August"}
MACRO {sep} {"September"}
MACRO {oct} {"October"}
MACRO {nov} {"November"}
MACRO {dec} {"December"}

READ

FUNCTION {set.is.kanji.entry}
{
  author    field.or.null is.kanji.str$
  title     field.or.null is.kanji.str$ or
  editor    field.or.null is.kanji.str$ or
  journal   field.or.null is.kanji.str$ or
  booktitle field.or.null is.kanji.str$ or
  series    field.or.null is.kanji.str$ or
  yomi      field.or.null is.kanji.str$ or
  'is.kanji.entry :=
}

ITERATE {set.is.kanji.entry}

INTEGERS { author.field editor.field organization.field title.field key.field }

FUNCTION {init.field.constants}
{ #0 'author.field :=
  #1 'editor.field :=
  #2 'organization.field :=
  #3 'title.field :=
  #4 'key.field :=
}

EXECUTE {init.field.constants}

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

%%% この変数はなんのために使われてる？
INTEGERS { et.al.char.used }

FUNCTION {initialize.et.al.char.used}
{ #0 'et.al.char.used :=
}

EXECUTE {initialize.et.al.char.used}

FUNCTION {format.lab.names}
{ 's :=
   s num.names$ 'numnames :=
   numnames #2 >
	{ s is.kanji.str$
	  { s #1 "{ff}" format.name$ 't :=
		t empty$
		  { s #1 "{ll}" format.name$}
		  { s #1 "{ff}" format.name$}
		if$
 		"他" * }
	  { s #1 "{ll}" format.name$
		" et~al." * }
	  if$
	}
	{ numnames #2 =
	  { s is.kanji.str$
		{ s #1 "{ff}" format.name$ 't :=
		  t empty$
			{ s #1 "{ll}" format.name$}
			{ s #1 "{ff}" format.name$}
		  if$
		  s #2 "{ff~}{vv~}{ll}{, jj}" format.name$ "others" =
 			{"他" *}
			{ "・" *
			  s #2 "{ff}" format.name$ 't :=
			  t empty$
				{s #2 "{ll}" format.name$ *}
				{s #2 "{ff}" format.name$ *}
			  if$
			}
			if$
		}
		{ s #1 "{ll}" format.name$
		  s #2 "{ff~}{vv~}{ll}{, jj}" format.name$ "others" =
			{ " et~al." * }
			{ " and " *
			  s #2 "{ll}" format.name$ *}
			if$
		}
	    if$
	  }
	  { s is.kanji.str$
		{ s #1 "{ff}" format.name$ 't :=
		  t empty$
			{ s #1 "{ll}" format.name$}
			{ s #1 "{ff}" format.name$}
		  if$
		}
		{ s #1 "{ll}" format.name$ }
	    if$
	  }
	if$
	}
  if$
}

FUNCTION {format.lab.names.full}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
      { s is.kanji.str$
        { s nameptr "{ff}" format.name$ 't :=
	  nameptr #1 >
          { namesleft #1 >
              { "・" * t * }
              { t "others" =
                   { "他" * }
                  { "・" * t * }
                if$
              }
              if$
           }
           't
         if$
         nameptr #1 + 'nameptr :=
         namesleft #1 - 'namesleft :=
        }
        { s nameptr "{vv~}{ll}" format.name$ 't :=
          nameptr #1 >
            { namesleft #1 >
              { ", " * t * }
              { t "others" =
                  { " et~al." * }
                  { " and " * t * }
                if$
              }
              if$
           }
           't
         if$
         nameptr #1 + 'nameptr :=
         namesleft #1 - 'namesleft :=
       }
      if$
    }
  while$
  numnames #1 > #1 #2 = and {", eds" *} {} if$
  numnames #1 = #1 #2 = and {", ed" *} {} if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.key.label.full}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names.full }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
	{ key empty$
	    { cite$ #1 #3 substring$ }
	    { key #3 text.prefix$ }
	  if$
	}
	{ editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label.full}
{ author empty$
    { editor empty$
	{ key empty$
	    { cite$ #1 #3 substring$ }
	    { key #3 text.prefix$ }
	  if$
	}
	{ editor format.lab.names.full }
      if$
    }
    { author format.lab.names.full }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
	{ organization empty$
	    { cite$ #1 #3 substring$ }
	    { "The " #4 organization chop.word #3 text.prefix$ }
	  if$
	}
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
	{ organization empty$
	    { cite$ #1 #3 substring$ }
	    { "The " #4 organization chop.word #3 text.prefix$ }
	  if$
	}
	{ key #3 text.prefix$ }
      if$
    }
    { editor format.lab.names }
  if$
}

%% From jalpha.bst
FUNCTION {calc.label}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
	'editor.key.organization.label
	{ type$ "manual" =
	    'author.key.organization.label
	    'author.key.label
	  if$
	}
      if$
    }
  if$
  duplicate$
  year field.or.null purify$ #-1 #2 substring$
  *
  'label :=
  year field.or.null purify$ #-1 #4 substring$
  *
  sortify 'sort.label :=
%   sort.label write$  newline$   % For debug.
}

FUNCTION {calc.cyear}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
	'editor.key.organization.label
	{ type$ "manual" =
	    'author.key.organization.label
	    'author.key.label
	  if$
	}
      if$
    }
  if$
  duplicate$
  "" swap$ *
  "" year *
  'cyear :=
  year field.or.null
  *
  sortify 'sort.label :=
}

FUNCTION {calc.flabel}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label.full
    { type$ "proceedings" =
	'editor.key.organization.label
	{ type$ "manual" =
	    'author.key.organization.label
	    'author.key.label.full
	  if$
	}
      if$
    }
  if$
  duplicate$
  is.kanji.entry
    {  }
    {  }
  if$
  "" swap$ *
  'flabel :=
  year field.or.null
  *
  sortify 'sort.flabel :=
}

FUNCTION {calc.alabel}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
	'editor.key.organization.label
	{ type$ "manual" =
	    'author.key.organization.label
	    'author.key.label
	  if$
	}
      if$
    }
  if$
  duplicate$
  "" swap$ *
  'alabel :=
  year field.or.null
  *
  sortify 'sort.alabel :=
}

FUNCTION {sort.format.names}
{ 's :=
  yomi empty$
     'skip$
     { yomi 's := }
  if$
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
	{ ", " * }
	'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
 	{ s is.kanji.str$
  		{"他" * }
 		{" et~al." *}
	  if$
 	}
	{ t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
	{ "to sort, need author or key in " cite$ * warning$
	  ""
	}
	{ key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
	{ key empty$
	    { "to sort, need author, editor, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
	{ key empty$
	    { "to sort, need author, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
	{ key empty$
	    { "to sort, need editor, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

%%% 順序をソートするために yomi を加工する。
FUNCTION {yomi.label}
{ yomi is.kanji.str$
    % yomi がひらがなのケース。year を付け足すのみ。
    { yomi year * }
    % yomi が alphabet のケース。名前を加工してから小文字に変換し、year を
    % 付け足す
    { yomi format.lab.names "l" change.case$ year * }
  if$
}

FUNCTION {presort}
{ calc.cyear
  pop$
  is.kanji.entry
    { yomi empty$
       { sort.label }
       { yomi.label }
      if$
      "" *
    }
    { sort.label "" * }
  if$
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
	'editor.organization.sort
	{ type$ "manual" =
	    'author.organization.sort
	    'author.sort
	  if$
	}
      if$
    }
  if$
  * " "
  *
  year field.or.null sortify
  *
  " "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {calc.flabel}
ITERATE {calc.alabel}
ITERATE {presort}

SORT

STRINGS { longest.label last.sort.label next.extra prev.author this.author}

INTEGERS { longest.label.width last.extra.num }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #0 int.to.chr$ 'last.sort.label :=
  "" 'next.extra :=
  #0 'longest.label.width :=
  #0 'last.extra.num :=
  "" 'this.author :=
}

% \bysame を使う場合は、sort.label が前回のものと同一であれば、extra.labelをセット
% author が前回のものと同一であれば、extra.label.bysameをセット
FUNCTION {forward.pass}
{ bst.use.bysame #0 =
    % \bysame を使わない場合
    { last.sort.label sort.label =
        { last.extra.num #1 + 'last.extra.num :=
          last.extra.num int.to.chr$ 'extra.label :=
        }
        { "a" chr.to.int$ 'last.extra.num :=
          "" 'extra.label :=
          sort.label 'last.sort.label :=
        }
      if$
    }
    % \bysame を使う場合
    { last.sort.label sort.label =
        { last.extra.num #1 + 'last.extra.num :=
          last.extra.num int.to.chr$ 'extra.label :=
        }
        { "a" chr.to.int$ 'last.extra.num :=
          "" 'extra.label :=
          sort.label 'last.sort.label :=
        }
      if$
      author empty$
        { editor empty$
          { "" }
          'format.editors
          if$
        }
        'format.authors
      if$
      'this.author :=
      % format.names 'this.author :=
      this.author prev.author =
        { "bysame" 'extra.label.bysame := }
        { this.author "" =
            { "abcxyz" }
            'this.author
          if$
          'prev.author :=
        }
      if$
    }
  if$
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label empty$ not
    { cyear extra.label * }
    { cyear "" * }
  if$
  "" field.or.null *
  'cyear :=
  cyear width$ longest.label.width >
    { cyear 'longest.label :=
      cyear width$ 'longest.label.width :=
    }
    'skip$
  if$
  extra.label 'next.extra :=
}

EXECUTE {initialize.longest.label}

ITERATE {forward.pass}

REVERSE {reverse.pass}

FUNCTION{punctuation}
{
  "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"  write$ newline$
  "%"                                                                    write$ newline$
  "%  This bbl file is created through jecon.bst ver. " jecon.version * write$ newline$
  "%  jecon.bst is available at"                                         write$ newline$
  "%  <http://park.zero.ad.jp/~zbc08106/tex/jecon/>"                     write$ newline$
  "%"                                                                    write$ newline$
  "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"  write$ newline$
  newline$
}

EXECUTE {punctuation}

FUNCTION {begin.bib}
{
  et.al.char.used
    % et.al.char が使われているケース
    { "\newcommand{\etalchar}[1]{$^{#1}$}" write$ newline$ }
    % et.al.char が使われていないケース
    'skip$
  if$
  preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  bst.use.bysame #0 =
     % bysame を使わないケース
     'skip$
     % bysame を使うケース
     { "\ifx\undefined\bysame" write$ newline$
       "\newcommand{\bysame}{\leavevmode\rule[.5ex]{3em}{.3pt}\ }"
       write$ newline$
       "\fi" write$ newline$ }
  if$
  newline$
  "\begin{thebibliography}{xx}" write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
