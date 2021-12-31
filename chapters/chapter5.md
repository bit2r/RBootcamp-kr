---
title: '5장: broom을 이용한 간단한 통계 모델링' 
description: 이제 우리는 깔끔한 데이터를 가지고 있습니다. 이제 몇 가지 통계분석을 시작합니다!
prev: /chapter4
next: /chapter6
id: 5
type: chapter
---

</codeblock></exercise>

<exercise id="1" title="어부 수은 데이터 세트 탐색">

우리는 어부의 수은(fishermen mercury) 데이터라 불리는 데이터 세트를 탐색할 것입니다. 이 데이터 세트는 어부 그룹과 어부가 아닌 콘트롤 그룹 간의 수은 노출에 관련된 정보들로 구성되어 있습니다.

먼저 이 데이터세트에 대한 추가 정보를 살펴보세요. [README](http://www.stat.ufl.edu/~winner/data/fishermen_mercury.txt)

그런 다음, `glimpse()`을 사용하여 데이터의 구조를 살펴보고, `table()`을 수행해 봅니다.

`table()`의 첫번 째 사용은, `fisherman`의 분포를 파악하는 돗수분포표(frequency table)를 구하기 위해서, 파이프의 일부로 `table()`을 사용합니다. 어부와 어부가 아닌 사람들 중에서 어느 그룹의 관측치 수가 더 많습니까?

`fisherman`과 `fishpart`의 교차표(cross-table, 혹은 분할표 contingency table)를 구하기 위해서, 파이프의 일부로 `table()`을 사용합니다. 어부는 어부가 아닌 사람들보다 생선을 통째로 먹을  가능성이 더 높습니까?

(역자 주) library(dplyr)을 실행하면, 패키지를 로드하면서 여러 정보가 콘솔에 출력됩니다. 그러나 이 정보는 연습문제를 학습하는데 혼란을 줍니다. 그래서 **`suppressPackageStartupMessages()` 함수를 감싸서 함수 로드 시 출력되는 메시지를 제거**합니다. **앞으로 관련된 모든 연습문제에 적용**됩니다.

<codeblock id="05_01">
</codeblock></exercise>

<exercise id="2" title="어부 여부별 평균 수은 시각화">

어부 여부(`fisherman`)별로 총 수은(`total_mercury`)의 평균을 시각화하여 두 그룹(1 - "어부"", 0 - "어부 아님"")에 차이가 있는지 살펴봅니다.

`geom_boxplot()`로 `fisherman`별로 `total_mercury`의 중위수를 시각화합니다. 그러기 위해서 `fisherman`를 범주형인 팩터로 형 변환합니다.

우리는 평균이 중위수와 어떻게 차이나는지, `stat_summary()`을 사용해서 평균을 점(포인트)으로 추가할 수 있습니다.


<codeblock id="05_02">
</codeblock></exercise>

<exercise id="3" title="group_by()로 평균 계산">

`fisherman` 그룹별로 평균과 표준편차를 구하기 위해서 `group_by()`와 `summarize()`를 사용합니다.

`dplyr` 패키지의 `group_by()`를 사용해서 `fisherman`별로 **그룹 `데이터 프레임`**을 만든 후, `summarize`로 각 그룹별로 평균과 표준편차를 구합니다.

<codeblock id="05_03">
</codeblock></exercise>

<exercise id="4" title="차이가 있습니까?">

어부와 어부가 아닌 두 그룹 사이에 차이가 있습니까?

<choice>
<opt text="아니요, 차이가 없습니다. 평균이 너무 비슷합니다.">
다시 한번 살펴보세요.
</opt>
<opt text="예, 차이가 있습니다. 범위는 겹치지만 평균은 분명히 차이가 있습니다."  correct = "true">
어부의 총 수은 값이 더 높습니다.
</opt>
</choice>
</exercise>

<exercise id="5" title="어부 여부에 대한 t-검정">

정규분포를 따르는 두 분포의 평균을 비교하는데 사용하는 일반적이고 매우 유용한 가설검정 방법에 t-검정이 있습니다. 귀무가설은 두 독립적인 그룹의 평균이 동일하다는 것이고, 대립가설은 두 평균이 동일하지 않다는 것입니다.(양측 검정)

우리는 어부의 총 수은에 대한 평균이, 어부가 아닌 사람들의 평균과 다른지 검정하려 합니다. 이 검정의 p-값(p-value)는 얼마입니까?

`t.test()` 함수를 사용하여 어부와 어부가 아닌 그룹의 `total_mercury`에 대한 평균을 비교합니다.

<codeblock id="05_05">
</codeblock></exercise>

<exercise id="6" title="broom으로 모델 결과 쓸어담기">

t-검정의 결과는 깔끔하지 않습니다. 안그런가요? 모델의 결과를 깔금한 데이터 테이블로 정리하는 `broom`이라는 아주 편리한 패키지가 있습니다. 재미있게도 `tidy()`라는 이름의 함수로 이 작업을 수행합니다. 함수 이름이 꿰 직관적입니다.

`tidy()`를 사용하여 t.test()의 결과를 `tidyTtest`라는 이름의 데이터 프레임에 저장하세요. 그런 다음 `glimpse()`로 어떤 정보들이 들어 있는지 확인하세요. 마지막으로 데이터 프레임에서 p-값(p-value)와 같은 결과를 쉽게 추출하는 방법을 살펴봅니다.


<codeblock id="05_06">
</codeblock></exercise>

<exercise id="7" title="데이터 더 살펴보기">

이 데이터에는 공변량(covariates)이 있습니다. 이러한 공변량을 사용하여 수은에 노출되는 정도를 예측할 수 있을지의 여부를 확인하려고 합니다. 또다른 공변량이 어부와 총 수은 사이의 관계를 교란시킬(confounding) 수 있을까요?

(역자 주) 이 장의 주제는 선형 회귀분석 모델로, "어부 여부(어부 vs 비어부)와 수은에 노출되는 정도"에 대한 연구에 사례를 이용했습니다. 회귀분석 모델에서 관심의 대상이 되는 '수은에 노출되는 정도'를 **종속변수**라 하고, 이를 예측하는데 사용되는 변수를 **독립변수**라 부릅니다. 이 모델식을 개괄적으로 표현하면 `y = f(x) + e`로 표현됩니다. 종속변수 y를 예측하는 독립변수 x에 대한 함수를 정의하는 것이 선형 회귀분석으로 볼 수 있습니다. 여기서 e는 오차항입니다. 100% 완벽한 모델은 없으니까요. 오차항을 작게 하는 것이 모델을 적합하는 분석가의 목표입니다.

총 수은(`total_mercury`)을 체중(`weight`)과 주당 생선 섭취 횟수(`fishmlwk`)에 대해서 각각의 산점도를 그려봅니다. 연관성이 있는 것처럼 보이나요?

(역자 주) **독립변수로 설정되어 있지는 않지만, 종속변수에 영향을 미칠 수 있는 변수를 공변량**이라 합니다. 그리고 독립변수 **`어부 여부`**가  공변량인 체중(`weight`)이나 주당 생선 섭취 횟수(`fishmlwk`)에 영향을 받는다면, 실제로 이들 공변량에 때문에 `어부 여부`가 `수은 노출 정도`의 **진정한** 원인이 아닐 수 있습니다. 이 경우 교란(confounding) 효과가 발생했다고 합니다. 그리고 해당 공변량을 교란 변수(confounding factor, confounder)라 부릅니다. 교란 변수는 독립변수 x와 종속변수 y모두에 영향을 미칩니다.

`geom_point()`로 두 변수의 산점도를 그려 보세요.


<codeblock id="05_07">
</codeblock></exercise>

<exercise id="8" title="선형 회귀분석">

체중(`weight`)과 주당 생선 섭취 횟수(`fishmlweek`)가 `total_mercury`와 관련있어 보입니다. 
또한 그것은 어부 여부(`fisherman`)와도 관련이 있어 보입니다. 우리는 앞에서 교차표(분할표)로 어부가 물고기 섭취 횟수가 더 많은 경향이 있음을 인지했었습니다. 

선형 회귀모델을 사용하여 가능한 교란요인(confounders)들을 조정할 수 있습니다. 
먼저  `fisherman`을 `total_mercury`의 예측변수(독립변수)로 사용해서 단변량 선형 회귀모델을 만듧니다. 그런 다음 다음 3개의 독립변수를 포함하는 다중 선형 회귀모델과 비교합니다.

참고: 선형 회귀모델의 p-값은 t-검정과 유사하지만, t-검정이 두 그룹(`t.test()의 기본 인수인 `var.equal=TRUE`) 간의 등분산을 가정하기 때문에 완전히 동일하지 않습니다.

독립변수 `fisherman`와 종속변수 `total_mercury`로 선형모델을 적합한 후 그 결과를 `fit_univariate`에 저장하세요. 그리고 독립변수 `fisherman`, `weight`, `fishmlwk`와 종속변수 `total_mercury`로 선형모델을 적합한 후 그 결과를 `fit_multiple`에 저장하세요. 

<codeblock id="05_08">
</codeblock></exercise>

<exercise id="9" title="회귀 계수의 해석">

다중 선형회귀 모델의 결과에서 주당 생선 섭취 횟수의 회귀계수("Estimate" 컬럼)은 무엇을 의미하나요?

<choice>
<opt text="생선을 먹을 때마다 수은을 섭취할 가능성이 1.02배 더 높아집니다.">
아니오. 효과는 가중되지 않습니다.
</opt>
<opt text="매주 추가되는 생선 섭취 횟수는 동일한 체중의 어부나 어부가 아닌 사람들의 수은 수준을 0.106mg/g 증가시킬 것으로 예상됩니다."  correct = "true">
체중과 어부 여부를 조정하여, 주당 생선 섭취 횟수가 가산 효과로 모델링됩니다.
</opt>
<opt text="일주일에 한 번 더 어분을 먹는 어부는 0.106mg/g의 더 높은 수은 수치를 가질 것으로 예상됩니다."
그렇지 않습니다. 이 예상 증가율은 어부뿐만 아니라 비 어부에게도 적용됩니다.
</choice>
</exercise>

<exercise id="10" title="선형 회귀분석 결과 깨끗하게 보기: glance">

이제 예측(독립)변수로부터 예측되어지는 결과(총 수은 양)로 설명되는 분산의 양을 수량화한,  모델의 적합도 척도인 결정계수(R^2)를 측정하는 작업을 수행해 보겠습니다. 
`glance()` 함수로 모델을 요약한 정보를 얻습니다. `tidy()`는 모델의 각 항(term)에 대해서 하나의 행으로 공변량 정보를 tibble 데이터 객체로 반환했지만, `glance()`는 모델의 단일 값 정보들을 모아서 단 한 행을 갖는 tibble 객체를 반환합니다.

`summary()`를 사용해서 적합한 모델 `fit_multiple`로부터 R^2를 얻습니다. 그리고 나서 `broom::glance()`을 사용합니다.

(역자 주) glance() 함수는 열의 개수가 13개인 tibble 객체를 반환합니다. 그런데, 이 코스 플랫폼은 13개의 결과를 중첩하여 화면에 출력합니다. 이 경우는 결과를 해독할 수 없습니다. 그래서 부득이하게 실습에서는 1~7, 8~13까지의 컬럼을 나눠서 출력합니다. 만약에 개인 PC 환경에서 작업할 때에는 굳이 나눠 출력할 필요가 없습니다.

<codeblock id="05_10">
</codeblock></exercise>

<exercise id="11" title="모델의 비교">

우리는 `fit_univariate`, `fit_multiple` 두 모델을 만들었습니다. 첫 번째 모델은 예측변수 `fisherman`만 포함되고, 두 번째 모델은 `fisherman`와 `weight`, `fishmealwk`가 포함되어 있습니다.

어떤 모델이 더 잘 예측합니까? 그리고 체중과 주당 생선 섭취 횟수를 조정할 때, 어부 여부와 총 수은의 연관성은 어떻게 변합니까? 다른 공변량은 총 수은과 유의하게 관련되어 있습니까?


`tidy()`를 사용하여 두 모델에서 공변량 정보를 추출하고, dplyr 패키지의 `bind_rows()`로 하나의 데이터 프레임을 만듭니다.
`glance()`를 사용하여 모델 요약 정보를 수집합니다. 그런 다음, dplyr 함수를 사용해서 두 모델에 대해서 어부 여부의 공변량 결과만 확인합니다.

(역자 주) `glance()` 함수는 열의 개수가 13개인 tibble 객체를 반환합니다. 그런데, 이 코스 플랫폼은 13개의 결과를 중첩하여 화면에 출력합니다. 이 경우는 결과를 해독할 수 없습니다. 그래서 부득이하게 실습에서는 1~7, 8~13까지의 컬럼을 나눠서 출력합니다. 만약에 개인  PC 환경에서 작업할 때에는 굳이 나눠 출력할 필요가 없습니다.  

<codeblock id="05_11">
</codeblock></exercise>

<exercise id="12" title="수은 예측">

어부가 더 높은 수준의 수은과 관련있다고 얼마나 확신합니까?

<choice>
<opt text="확실합니다, 나는 어부가 되고 싶지 않아요!">
정말이세요?</opt>
<opt text="자신 없습니다, 여기에는 다소 혼란스러운 요소가 있습니다. 아마도 생선을 덜 먹어야 할까요?" correct = "true">
총 수은의 수준은 생선의 섭취량과 관련있어 보이며, 다중 선형회귀 모델에서 이를 조정한 후의 어부 여부는 더 이상 총 수은의 수준과 관련되지 않습니다.
</opt>
</choice>
</exercise>

<exercise id="13" title="실습 1: augment + ggplot2">

우리는 몇개의 모델이 있습니다. 그리고 모델과 함께 예측 또는 적합된 값이 제공됩니다. 즉, `total_mercury`인 "y"를 예측하기 위해서 선형 회귀모델을 적합했으며, 모델에 기반해서 적합한 값들을 얻을 수 있습니다. 이 적합된 예측값을 `total_mercury`의 실제 값과 비교할 수 있습니다

broom 패키지의  `augment`는 예측된 값들을 알려줍니다. ggplot2를 사용해서 `total_mercury`의 실제 값과 예측된 값을 시각화합니다. 

실습을 수행하는 동안 당신은 아래 주소에서 `ggplot2` 치트시트(커닝 페이퍼)를 참조할 수 있습니다.:
[ggplot2 cheatsheet](https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-visualization.pdf)

+ 두 모델에 `augment()`를 사용해서 `total_mercury`의 적합된 값을 얻고, 이를 새 데이터 프레임 `fit_univariate_augment`와 `fit_multiple_augment`에 저장합니다.
+ `bind_rows()`를 사용하여 이러한 데이터 프레임을 하나의 길고 깔끔한 데이터 프레임으로 묶습니다. 
+ 그런 다음 `ggplot2`를 사용하여 `fishmlwk`로 색상이 지정된, `total_mercury`의 적합값과 실제 값의 산점도를 만들고 점의 모양이 `fisherman`에 해당하도록 합니다. 
+ `facet_wrap()`을 사용하여 두 모델의 플롯을 나란히 표시합니다. 결과를 효과적으로 해석하기 위해 대각선을 추가하면, 적합된 값이 얼마나 밀접한 상관 관계가 있는지 확인할 수 있습니다.



<codeblock id="05_13">
</codeblock></exercise>

<exercise id="14" title= "오! 얼마나 멀리 왔는지, 당신의 위치를 보세요!">

`tidyverse`는 이제 당신의 동반자입니다! 여러분이 `tidyverse`를 재미있게 배웠기를 바라며, 또한 당신이 앞으로 더 많은 것을 배울 수 있기를 바랍니다.

**추가 리소스**

[R for Data Science - 한국어](https://bookdown.org/sulgi/r4ds/)를 중점적으로 보기 시작하세요. 그리고 [the R4DS community](https://www.rfordatasci.com/)에서 tidyverse를 배우는 다른 학습자들과도 이야기를 나누어 보세요. 진심으로, 이것은 멋진 커뮤니티 그룹이며 그들이 당신이 더 많이 배울 수 있도록 격려할 것입니다!
</exercise>
