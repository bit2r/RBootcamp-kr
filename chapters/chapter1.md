---
title: 'Chapter 1: ggplot2의 마법' 
description: ggplot2로 데이터의 변수를 통계 플롯으로 시각화는 방법 학습
prev: null
next: /chapter2
id: 1
type: chapter
---
<exercise id="1" title="간단한 데이터 프레임 소개">

`데이터 프레임(data.frame)`의 기초적인 구조를 살펴봅니다.
`데이터 프레임`은 테이블과 유사한 데이터 형식으로, 다음과 같은 속성을 갖습니다.: 

<img src="tidy-1.png">

+ 열 (variables) 
  - 컬럼은 서로 다른 데이터 유형을 가질 수 있습니다. (`numeric`, `character`, `boolean`, `factor`)
  - 컬럼은 "변수(variables)"라고 부릅니다.
+ 행 (observations)    
  - 행은 단일 관측치(observations)에 해당합니다.
  - 특정 조건에 따라서 필터링이 가능하고, 부분 집합으로 만들 수 있습니다.
+ 셀 (values)
  - 행과 열이 교차하는 개별 셀을 값(values)이라 부릅니다.
    

`데이터 프레임`의 개별 변수는 `$` 연산자로 액세스할 수 있습니다. (예시:  `gap1992$pop`).
그러나 우리는 이 방식을 거의 사용하지 않을 것입니다. `tidyverse`을 사용하면 이 연산자 없이 쉽게 변수를 액세스할 수 있기 때문입니다.

`gap1992` 데이터에 대해서 `colnames()`와 `head()`를 실행하여 각 컬럼의 데이터를 살펴봅니다. 그런 다음 `nrow()`를 사용하여 데이터 세트에 몇 개의 행(관측치)이 있는지 확인합니다.
답변을 제출하기 전에 콘솔에서 실행하세요.

<codeblock id="01_01">
</codeblock></exercise>

<exercise id="2" title="시각적 요소에 대한 고찰">
이제 `데이터 프레임`에 대해 조금은 이해할 수 있습니다. 그러면 좀더 재미있는 영역으로, 데이터 프레임으로 그래프(플롯) 만들 수 있습니다.
먼저 플롯에 변수를 표현하는 방법에 대해서 생각해 볼 것입니다.

데이터 세트의 변수를 어떻게 시각적으로 표현할 수 있을까요? 이 그래프를 보십시오. x-축과 y-축에 어떤 변수가 매핑되고, 색상(color)에는 어떤 변수가 매핑되었습니까? 

<img src="gap1992.png">

<choice>
<opt text="x = gdpPercap, y = log(lifeExp), color = continent">
좌표의 축을 바꿔서, 잘못된 변수에 로그를 취하고 있습니다.</opt>
<opt text="x = continent, y = year, color = pop">
잘못된 변수지정입니다. 다시 돌아가서 매핑되는 항목을 확인하세요.</opt>
<opt text="y = lifeExp, x = log(gdpPercap), color = continent" correct = "true">
잘하셨습니다! lifeExp를 y-축 변수로, log(gdpPercap)를 x-축 변수로 지정했습니다.</opt>
</choice>
</exercise>

<exercise id="3" title="플롯을 그리기 위한 변수의 기하학적 매핑">

통계 그래픽은 다음으로 구성됩니다.:

+ 데이터(`data`)의 변수를,
+ 심미적(`aes()`thetic) 속성의,
+ 기하학적(`geom_`etric) 객체에 매핑(`mapping`).
+ 역자 주)
  - **aesthetic 속성**은 심미적 속성으로 번역되지만, **시각적으로 표현할 수 있는 속성들로** 이해하세요. 앞으로 **미적**으로 표현합니다.
  - **geometric(기하학적)**은 **모양, 위치, 크기 등 공간에서의 도형의 성질**을 의미합니다.

이것은 ggplot2 코드에서 다음처럼 번역됩니다.:

```{r}
ggplot(data = gap1992, mapping = aes(x = log(gdpPercap), y=log(pop))) +
  geom_point()
```

위의 예제 코드를 분리해 보겠습니다. 
`ggplot2`는 항상 `ggplot()` 함수의 호출로 시작합니다. 이 함수에는 다음과 같은 두 가지가 필요합니다.:

1. 데이터(`data`) - 이 사례에서는, `gap1992`.
2. 매핑(`mapping`) - `aes()` 함수를 이용한 미적 매핑. 

변수를 미적 속성에 매핑하려면, 미적(`aes()`thetic) 매핑 함수인 `aes()` 함수를 사용해야 합니다. 이 예제에서는, `x`에 `log(gdpPercap)`를 `y`에 `log(pop)`를 매핑했습니다.

마지막으로는, `geom_point()` 함수로 플롯에 기하학적 요소를 중첩하여 시각화할 수 있습니다.

출력된 플롯을 기반으로, 아래 코드에서 적절한 변수를 `x`, `y` 미적 속성에 매핑하세요. 그리고 시각화 스크립트를 실행하세요. **답변을 제출하기 전에 콘솔에서 스크립트를 실행해 볼 수 있습니다.**

<img src="gap1992.png">


<codeblock id="01_03">
그래프를 자세히 살펴보세요.  그리고 `gap1992` 데이터 세트의 변수 이름이 필요한 경우에는 `head()` 혹은 `colnames()` 함수로 확인할 수 있습니다..</codeblock></exercise>

<exercise id="4" title="미적 매핑 더 알아보기">
`geom_point()` 함수에는 연습문제보다 더 많은 미적 요소가 있습니다. 그리고 중요한 것은, ggplot2를 잘 다루기 위해서는 `geom`로 시작하는 함수들(이하 `geom`)의 미적 속성을 알아야한 다는 것입니다. `geom`에 매핑할 수 있는 미적 요소를 알고 싶을 경우에는 `help(geom_point)`처럼 `help()` 함수를 사용하세요.

geom_point() 함수에 매핑할 수 있는 미적 속성의 목록은 __[도움말](https://ggplot2.tidyverse.org/reference/geom_point.html)__을 참조하세요. 그리고 모든 미적 매핑을 살펴보세요.

다음 중 `geom_point()`에 매핑할 수 있는 미적 요소가 *아닌 것*은 무엇인가요?

<choice>
<opt text="`x`">
틀렸습니다. 점(포인트)을 매핑하려면 `x`가 필요합니다!</opt>
<opt text="`shape`">
아닙니다. 이것은 `geom_point()`에 매핑이 가능한 미적 요소입니다.</opt>
<opt text="`linetype`" correct = "true">
정답입니다. `linetype`은 `geom_point()`에 매핑할 수 없습니다. 점의 요소에는 선 종류가 필요없습니다.</opt>
</choice>
</exercise>

<exercise id="5" title="점 대 선">

 `ggplot2`의 장점은 시각화 표현을 쉽게 바꿀 수 있다는 점입니다.  
 `geom_point()`를 `geom_line()`로 교체하여, x-y 좌표에서의 점들을 대신해서 선을 그릴 수 있습니다. 

먼저 코드를 실행하여 점이 있는 플롯을 확인합니다. 그 다음에 `geom_point()`를 `geom_line()`으로 변경합니다.
무슨 일이 일어났나요? 데이터의 시각적 표현은 어떻게 변경되었습니까?


<codeblock id="01_05">
</codeblock></exercise>

<exercise id="6" title="ggplot의 레이어인 기하학적 표현">

We are not restricted to a single geom on a graph! You can think of geoms
as layers on a graph. Thus, we can use the `+` symbol to add geoms to our
base `ggplot()` statement. 

우리는, 그리고 ggplot2는 그래프 표현을 단일 기하적 표현으로 제한하지 않습니다! 
기하학적 표현(Geoms)을 그래프의 레이어(layers)로 생각할 수 있습니다. 따라서, `+` 심볼을 통해서 기본 `ggplot()` 구문에 기하학적인 표현을 추가할 수 있습니다.  

`geom_line()`와 `geom_point()` 두 기하학적 표현을 다음 ggplot 코드에 추가합니다. 예상한대로 결과가 나타났습니까?

<codeblock id="01_06">
</codeblock>
</exercise>


<exercise id="7" title="ggplot2의 빠른 리뷰">

`ggplot` 구문에서 `+`는 어떤 역할을 수행합니까?

예를 들어:

```{r}
ggplot(gap1992, aes(x = log(gdpPercap), y = lifeExp, color=continent)) +
  geom_line() + geom_point()
```

<choice>
<opt text="하나의 `데이터 프레임을` 다른 `데이터 프레임`에 추가합니다. ">
그렇지 않습니다. 다시 ggplot 코드를 확인하십시오.</opt>
<opt text="데이터와 기하학적 표현을 하나의 통계 그래픽으로 연결할 수 있습니다." correct="true">
맞습니다! 이것은 데이터와 기하학적 표현 레이어를 함께 추가하는 방법입니다.</opt>
<opt text="`데이터 프레임`에 변수를 추가할 수 있습니다.">
ggplot 코드를 보고 데이터를 조작하는지의 여부를 확인해 보십시오.</opt>
</choice>
</exercise>

<exercise id="8" title="최종 과제: Gapminder 플롯의 재현">

마지막 과제는 `gap1992` 데이터를 사용하여 아래 그래프를 완전히 다시 만드는 것입니다.

<img src="gap1992.png">

- 변수 이름을 기억해야 하는 경우는 콘솔에서 `head(gap1992)` 또는 `colnames(gap1992)`을 호출할 수 있습니다.
- 변수를 올라른 미적 요소에 매핑하여, 위의 그래프를 다시 만듧니다. 답변을 제출하기 전에 콘솔에서 스크립트를 실행해 볼 수 있습니다.

<codeblock id="01_08">
</codeblock></exercise>

<exercise id="9" title="이 챕터에서 배운 내용">

- `ggplot2`의 기본 문법.
- `ggplot2`의 `geom_point()`와 `geom_bar()`를 사용하여 x-y 좌표에 데이터 플로팅.
- `aes()`을 사용하여 데이터의 변수를 미적 요소에 매핑.
- `geom`는 그래프의 레이어에 해당하며,
- 그것은 `ggplot2`가 꿰 멋진 그래프를 만들 수 있다는 것.
- 당신이 이것을 할 수있다는 자심감 함양!

**추가 리소스**

- [R For Data Science: 데이터 시각화](https://bookdown.org/sulgi/r4ds/data-visualisation.html): 데이터 과학을 위한 R의 시각화 챕터. 특히 유용한 것은 [심미성 매핑](https://bookdown.org/sulgi/r4ds/data-visualisation.html#심미성-매핑)과 [자주 일어나는 문제들](https://bookdown.org/sulgi/r4ds/data-visualisation.html#자주-일어나는-문제들) 섹션입니다.
- `ggplot2`의 스케일과 좌표계처럼 플롯을 수정할 수 있는 또 다른 방법을 학습하려면 [그래픽 레이어 문법](https://bookdown.org/sulgi/r4ds/data-visualisation.html#그래픽-레이어-문법)을 참고하세요.

<codeblock id="01_09">
</codeblock></exercise>

