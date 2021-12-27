---
title: 'Chapter 2: ggplot2과 범주형 데이터' 
description: ggplot2 이용한 시각화 추가 정보 학습
prev: /chapter1
next: /chapter3
id: 2
type: chapter
---
<exercise id="1" title="범주형 데이터 리뷰">

팩터(factors)는 R에서 범주형 데이터를 표현하는 방법입니다.

R에는 두 가지의 팩터가 있습니다.: 

+ `factor` - **명목형(nominal)** 데이터에 사용 (예, "오리", "고양이", "개")
+ `ordered`- **순서형(ordinal)** 데이터에 사용 (예, "10-30", "31-40", "41-60")

우리는 막대 그래프(barplots)를 조작하고 팩터를 사용하여 더 많은 정보를 추가할 것입니다.

다음은 `ggplot2`에서 팩터를 사용하는 방법에 사용할, 간단한 데이터 세트입니다.

+ 콘솔을 이용해서 `pets` 데이터 세트를 살펴 봅니다.
+ `dplyr` 패키지의 `glimpse()` 함수로 `pets`에 포함된 범주형 데이터들의 수준(levels)을 살펴봅니다.

<codeblock id="02_01">
</codeblock></exercise>

<exercise id="2" title="`geom_bar()`를 이용한 기본 막대 그래프">

이제 `pets` 데이터 세트에 어떤 범주형 데이터 변수가 포함되었는지 알았으므로, `geom_bar()`로 막대 그래프를 그려 범주형 데이터를 시각화할 수 있습니다.  

`geom_bar()`의 기본 동작은 범주형 데이터인 팩터의 수준별로 값의 개수를 카운트하는 것입니다. 여기서는 미적 요소인 `y`를 매핑하지 않습니다. 그 이유는 y 값이 카운트이기 때문입니다. 

이 데이터 세트가 주어지면, 동일한 이름을 가진 애완동물이 몇 마리인지 알고 싶어질 것입니다.

`ggplot` 구문에서 `x`에 변수 `name`을 매핑합니다. 가장 인기있는 애완동물 이름은 무엇입니까?


<codeblock id="02_02">
</codeblock></exercise>

<exercise id="3" title="스택 막대 그래프">

얼마나 많은 애완 동물들이 예방접종을 하였는지 살펴봅니다.  우리는 `fill`에 변수 `shotsCurrent`를 매핑하여, 이를 수행할 수 있습니다.

미적 요소 `fill`에 `shotsCurrent`을 매핑하세요.


<codeblock id="02_03">
</codeblock></exercise>

<exercise id="4" title="퀴즈">

다음 예제처럼 `geom_bar()` 함수에서 `color`에 `"black"`을 매핑하면 어떻게 동작하나요? 

```{r}
ggplot(pets, aes(x=animal, fill=shotsCurrent)) + 
  geom_bar(color="black")
```

<img src = "pet_black.png">

<choice>
<opt text="막대의 내부 색상의 기본값을 검정색으로 지정합니다.">
그렇지 않습니다. 그래프에서 어떤 것이 검게 표현되었나요?</opt>
<opt text="그래프의 텍스트를 검은색으로 지정합니다.">
그렇지 않습니다. 무엇이 검은색으로 매핑되는지 그래프를 확인하세요.</opt>
<opt text="막대의 윤곽선을 검은색으로 그립니다." correct="true">
오! 맞습니다, 우리는 검은색으로 막대의 윤곽을 그립니다.</opt>
</choice>
</exercise>

<exercise id="5" title="비율 막대 그래프">

우리는 서로 다른 범주간의 상대적 비율에만 관심이 있을 수 있습니다. 

이것을 시각화하는 것은 비율과 관련된 다양한 2 x 2 검정에 유용합니다. `position = "fill"` 매핑을 통해서, 
우리는 카운트보다 비율을 표현할 수 있습니다.

`geom_bar()` 함수의 `position` 인수값을 `"fill"`로 변경하세요. 접종하지 않은 개는 몇 퍼센트입니까?


<codeblock id="02_05">
</codeblock>
</exercise>

<exercise id="6" title="병렬 막대 그래프">

우리는 **개별 범주 안의 수준별 막대를 쌓는 스택 막대 그래프** 대신, 개별 범주 안의 수준별 막대들을 **병렬로 배치하는 병렬 막대 그래프**를 그릴 수 있습니다.

`geom_bar()` 함수의 `position` 인수값을 `"dodge"`로 변경하세요.

<codeblock id="02_06">
</codeblock>
</exercise>

<exercise id="7" title="그래프에서의 패싯">

또 다른 `팩터` 변수가 있고, 당신은 이 팩터를 기반으로 플롯을 계층화하려고 합니다. 
당신은 해당 변수의 이름을 **패싯(facet)**으로 지정하여 이를 수행할 수 있습니다.

여기서 우리는, 막대 그래프에서 `shotsCurrent`을 패싯으로 지정합니다.

```{r}
ggplot(data=pets, mapping=aes(x=name)) + geom_bar() + 
  ## "~" 표기법을 사용해서 패싯을 지정합니다.
  facet_wrap(facets=~shotsCurrent) + 
  ## 더 나은 가독성을 취해서 x-축 텍스트에 각도를 부여합니다.
  theme(axis.text.x = element_text(angle=45))
```

이 코드를 실행하면, 각 패싯의 범주에서 몇몇 수준의 공백이 있음을 알 수 있습니다. 
우리는 `facet_wrap()` 함수의 `scale="free_x"` 인수를 추가해서 각 패싯에서 이 공백을 제거할 수 있습니다.

scale 인수값에 `free_x`을 대입합니다. "Morris"라는 이름의 애완동물 중에서 몇마리가 접종하지 않았습니까? 

<codeblock id="02_07">
</codeblock>
</exercise>

<exercise id="8" title="빠른 리뷰">

패싯을 통해서 우리는 다음을 수행할 수 있습니다.:

```{r}
ggplot(pets, aes(x=name)) + geom_bar() + 
  facet_wrap(facets=~shotsCurrent, scale="free_x") +
  theme(axis.text.x = element_text(angle=45))
```

<choice>
<opt text="플롯의 포인트를 예쁘게 출력">
패싯은 그런 종류의 기하적 표현이 아닙니다!</opt>
<opt text="또 다른 범주형 변수로 그래프의 계층화" correct="true">
패싯은 추가 변수를 계층화하여 정보를 시각화하는 방법입니다.</opt>
<opt text="x-축에 또다른 범주 추가">
그렇지 않습니다.</opt>
</choice>
</exercise>

<exercise id="9" title="실습: 막대 그래프 그리기">

이제 당신이 배운 모든 것을 하나의 막대 그래프에 표현할 것입니다.

주어진 `pets` `데이터 프레임`으로:
+ 동물의 유형(`animal`)별 건수를 연령대(`ageCategory`)별로 살펴볼 수 있는 스택 비례 막대 그래프를 그립니다.
+ `shotsCurrent` 변수로 패싯을 만듧니다. 

예방 접종을 맞은 애완 동물의 비율이, 연령대로 동일한가요?

<codeblock id="02_09">
어떤 변수를 `x`, `fill` 인수에 매핑시킬 것인지, 어떤 값을 `position` 인수값에 사용할 것인지 생각하세요.
마지막으로, 변수를 어떻게 패싯화시킬 지 생각하세요.</codeblock></exercise>

<exercise id="10" title="박스 플롯">

박스 플롯을 사용하면 범주형 변수(`shotsCurrent`)별로  연속형 변수(`weight`)의 분포를 파악할 수 있습니다.

<img src="pet_shot.png">

이 플롯은 우리에게 무엇을 말해주고 있나요? 예방 접종한 동물과 그렇지 않은 동물의 체중 차이가 있나요?

(역자 주: 박스 플롯의 굵은 실선은 평균이 아니라 중위수(median)를 나타냅니다. 그러므로 이 문제의 예문에서는 평균이라는 표현보다는 중위수가 더 정확한 표현입니다. 중위수는 값을 크기 순서로 정렬했을 때, 정가운데에 위치한 값을 의미합니다. 극단값이 포함된 데이터에서의 평균윤 극단값의 영향을 받아서 왜곡되는 단점이 있습니다. 중위수는 극단값에 영향을 받지 않는 순서통계량이자 대표치입니다.  그러나 예문에서는 원 저작자의 표현인 평균을 사용하였습니다.)

<choice>
<opt text="평균에 약간의 차이가 있지만 그 차이는 유의해(significant) 보이지 않습니다" correct="true">
예, 이 경우는 사분위수 범위(IQR, InterQuartile Range)가 겹쳐서 유의하지 않을 것입니다. 사분위수 범위는 3사분위수(75%분위)와 1사분위(25%분위) 사이의 거리를 의미하며, 데이터의 퍼짐 정도를 파악하는 통계량입니다.</opt>
<opt text="평균에는 차이가 없습니다.">
판정 나름이지만, 그룹간의 평균에는 약간의 차이가 있습니다.</opt>
<opt text="평균에 큰 차이가 있으며, 그 차이는 아마도 통계적으로 유의할 것입니다.">
사실이 아닙니다. 사분위수 범위가 겹치므로 평균은 큰 차이가 없을 것입니다.</opt>
</choice>
</exercise>

<exercise id="11" title="geom_boxplot() 실행해보기">

애완 동물의 종류(`animal`)별로 체중(`weight`)에 대한 박스 플롯을 그리세요.
동물의 종류에 따라 체중의 차이가 있나요?


<codeblock id="02_11">
어떤 변수를 미적 속성에 매핑할지 생각해 보세요.</codeblock></exercise>

<exercise id="12" title="바이올린 플롯">

바이올린 플롯(Violin plots)은 데이터를 시각화하는 또 다른 유용한 방법입니다. 데이터에 대한 보다 미묘한 차이를 제공합니다. y축을 중심으로 미러링된 밀도 플롯입니다.

이 플롯은 y-축을 중심으로 데이터의 밀도(density)를 대칭되게 표현하여, 미묘한 분포도 파악할 수 있도록 도와줍니다.  
(역자주: 대칭된 밀도의 모양이 마치 바이올린처럼 보여서 바이올린 플롯이라 부릅니다. 밀도란, 연속형 데이터들이 몰려 있는 정도를 나타내는 통계량입니다. 바이올린 플롯에서 넓은 면적 부근에 데이터가 좀 더 많이 몰려서 분포한다고 판단하면 됩니다. 반대로 좁은 면적에는 데이터가 희박하게 분포함을 의미합니다.) 

+ ggplot 구문에 `geom_violin()`를 추가하세요.
+ 박스 플롯과 바이올린 플롯을 비교하면 어떤가요?
+ 더 많은 정보를 표현하나요? 혹은 표현하는 정보가 더 적나요? 


<codeblock id="02_12">
</codeblock></exercise>

<exercise id="13" title = "실습: 펫은 얼마나 무겁나요?">

+ 펫(`animal`) 종류별 체중(`weight`)을 시각화합니다.
+ 한 플롯에 박스 플롯과 바이올린 플롯을 그립니다.
+ 결론은 어떻나요? 어떤 동물이 다른 동물보다 평균 체중이 더 높나요?

<codeblock id = "02_13">
</codeblock>
</exercise>

<exercise id="14" title="이 챕터에서 배운 내용">

- 범주형 데이터를 시각화하는 방법
- 세 가지 플롯: `geom_bar()`, `geom_boxplot()`, `geom_violin()`
- (fill, x, y)와 같은 기하학적 요소에 미적 속성 매핑
- `geom_bar()`의 옵션 적용: position = "fill" (비율 막대 그래프), position = "dodge" (병렬 막대 그래프)
- `facet_wrap()`을 사용하여 그래프를 계층화하는 방법
- ggplot에서 여러 플롯을 한 플롯에 표현하는 방법


**추가 리소스**:

- 우리가 팩터라고 부르는 데이터 타입에 대해서 더 알고싶으면 [R for Data Science: 팩터형](https://bookdown.org/sulgi/r4ds/factors.html)을 참고하세요. 특히  [팩터 순서 수정하기](https://bookdown.org/sulgi/r4ds/factors.html#팩터-순서-수정하기)와 [팩터 레벨 수정하기](https://bookdown.org/sulgi/r4ds/factors.html#팩터-레벨-수정하기])의 정보가 유용합니다.
- [R4DS: 데이터 시각화: Facets](https://bookdown.org/sulgi/r4ds/data-visualisation.html#facets)

<codeblock id="02_14">
</codeblock></exercise>

