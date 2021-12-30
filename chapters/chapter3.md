---
title: '3장: dplyr 입문' 
description: 데이터를 ggplot2과 유사한 형식으로 조작하는 방법 학습
prev: /chapter2
next: /chapter4
id: 3
type: chapter
---
<exercise id="1" title="dplyr 소개">

우리는 `ggplot2` 패러다임에 부합하는 데이터 세트를 다뤄보았습니다. 그러나 우리가 접하는 대부분의 데이터는, 실제로는 지저분하거나(결측치 등이 포함되며) 완전히 다른 형식입니다. 이 장에서는 데이터 프레임을 조작할 수 있는, 'dplyr'라는 'tidyverse' 패키지 군의 가장 강력한 도구 중 하나를 살펴보겠습니다.
dplyr는 데이터 클린징을 수행하는 대부분의 성가신 작업에 대응하는 함수들이 있어 매우 유용합니다.

특히, `dplyr`에서 제공하는 다음의 여섯 가지 기본적인 동작을 살펴보겠습니다.:

- `filter()`
- `mutate()`
- `group_by()`/`summarize()`
- `arrange()`
- `select()`

이 과정에서 우리는 몇 가지의 데이터 조작 과제를 수행할 것입니다. 당신은 곧 `dplyr` 전문가가 될 것입니다!

`dplyr` 문법에 대해서 리마인드 하기 위해서 [dplyr 치트시트(컨닝 페이퍼)](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)가 유용할 수 있습니다. 별도의 창에 띄워두면 많은 도움이 됩니다. 

(역자 주) dplyr 치트시트가 2021년 7월 업데이트 되었습니다. 업데이트된 것을 원하시면, [최신 dplyr 치트시트](https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-transformation.pdf)를 사용하세요. 서로 보완재가 될 수 있어 공유합니다.

또한 `데이터 프레임`의 변수 이름을 알 필요가 있을 경우에는 다음 예제처럼 컬럼 이름을 조회하십시요. `biopics` `데이터 프레임`의 모든 변수 이름을 얻을 수 있습니다.: 

```{r}
colnames(biopics)
```

만약 함수에 대한 자세한 정보를 원할 경우에는 다음 `mutate()` 함수 `도움말`을 호출하는 것처럼 도움말을 요청하십시요.:

```{r}
?mutate
```

다음 학습으로 넘어갑니다!

</exercise>

<exercise id="2" title="할당에 대한 이해">

다음 학습을 수행하기 위해서는, 함수의 계산 결과를 변수에 할당하는 방법을 배울 필요가 있습니다. 

예를 들어, `<-` 연산자를 사용해서 `1 + 2` 연산의 결과를 `sumOfTwoNumbers`라는 변수에 `할당`할 수 있습니다. 이 연산자를 `할당 연산자`라 부릅니다.

`=`를 사용해서 값을 변수에 할당할 수도 있습니다. 그러나 이 방법은 값의 같음을 테스트하는 `비교 연산자` `==`와 혼동할 수 있습니다. 

```{r}
sumOfTwoNumbers <- 1 + 2
```

변수에 할당된 무엇인가는 아래 예제처럼 다른 표현식에서 사용할 수 있습니다.

```{r}
sumOfThreeNumbers <- sumOfTwoNumbers + 3
```

이것이 할당의 기본적인 사항입니다. 우리는 `dplyr`로 데이터를 정제할 때, 할당 연산자를 사용할 것입니다.

(역자 주) R은 여기서 언급하지 않은 연산자를 포함하요 꿰 많은 많은 할당 연산자를 제공합니다. 그러나 일반적인 값의 할당에서는 할당 연산자로는 `<-`를 사용하십시요. 그리고 함수 안에서 인수에 인수값을 대입하는 경우에만 `=` 연사자를 사용하십시요. 이것은 암묵적으로 룰로 R 고수들이 권장하는 방법입니다.  

### 할당 연산자 실습 지침

+ `newValue`에 `10`을 할당합니다. 
+ 그런 다음, `newValue * 5`을 계산하여 결과를 `multValue`에 할당합니다. 
+ `multValue`의 결과를 출력합니다.

<codeblock id="03_02">
</codeblock></exercise>


<exercise id="3" title="몇 가지 데이터 조작 방법">

W우리는 `fivethirtyeight` 패키지의 `biopics` 데이터 세트를 사용하여 `dplyr` 학습을 수행할 것입니다. 이 데이터 세트는 서로 다른 761 개의 전기 영화(유명 인사의 생애에 대한 영화) 정보를 담고 있습니다.

### 학습 지침

+ `biopics` 데이터 세트로 `summary`를 실행합니다.  이미 데이터는 준비해 놓았습니다. 
+ `country`변수에는 몇 개의 범주(수준, levels)가 있나요?

<codeblock id="03_03">
`levels()` 함수를 사용하면 범주의 개수를 셀 수 있습니다.</codeblock>
</exercise>

<exercise id="4" title="dplyr::filter()">

`filter()`는 매우 유용한 `dplyr`의 명령입니다. 이것은 변수의 기준(논리 조건식)에 따라서 `데이터 프레임`의 부분집합을 생성합니다.

예를 들면, `biopics` 데이터 세트 중에서 영국(`UK`)에서 제작된 영화를 부분집합으로 추출하려면 다음의 dplyr 구문(코드)을 사용합니다.

```{r}
# filter를 이용한 부분집합 생성
biopicsUK <- filter(biopics, country == "UK")
# 올바르게 부분집합이 추출되었는지 확인
biopicsUK
```

여기서 주의해야할 세 가지 사항: 

+ `filter()`의 첫번 째 인수값은 데이터 세트입니다.잠시 후에 우리는 또다른 변형을 볼 수 있을 겁니다.
+ 'biopics$country'처럼, 데이터 프레임의 변수를 액세스하기 위해서 `$` 연산자를 사용하지 않아도 됩니다. 대신, 단지 변수 이름인 `country`만 사용하면 됩니다.  
+ filter 구분에는 `==`를 사용합니다. `==`은 같음을 검사하는 비교 연산자입니다. 그리고 `=`는 어떤 값을 할당하는 할당 연산자임을 기억하십시요.(이 두 가지를 혼동하는 경우가 종종 있습니다.)

### 학습 지침

+ `Criminal` 영화만 표시되도록 `biopics`를 필터링합니다.(당신은 `biopics`의 변수인 `type_of_subject`를 사용해야 합니다.)
+ `nrow(crimeMovies)`를 사용해서 몇 건이 필터링되었는지 확인합니다.

<codeblock id="03_04">
</codeblock>
</exercise>

<exercise id="5" title="비교 연산자와 결합 연산자">

다음의 `filter()` 구문을 살펴 보세요.:

```{r}
filter(biopics, year_release > 1980 & 
    type_of_subject == "Criminal")
```

여기서 주의해야할 세 가지 사항: 

+ 우리는 비교 연산자인 `>`를 사용했습니다. 그리고 기본 비교 연산자에는 `>` (크다), `<` (작다), `==` (같다) and `!=` (같지 않다)가 있습니다. 
+ 우리는 `&` 연산자(AND)를 사용하여 또다른 표현식인 `type_of_subject == "Criminal"`을 연결했습니다. 그리고 당신이 사용해야 할 또 다른 결합 연산자는 OR에 해당하는 `|` 연산자입니다.
+ 표현식을 결합하는 것은 `filter()`의 사용에 있어서 아주 강력한 기능이 될 것입니다. 하지만 자칫 잘못 사용하면 논리적인 오류가 포함되어 예기치 않는 결과가 발생하는, 골치거리가 될 수도 있습니다. 그러므로 여러분은 결합 표현식을 사용할 때, 실수가 없도록 주의깊게 사용해야 합니다.

(역자 주) 원문에는 `&`와 `|`을 결합 연산자(chaining operators)라고 표현했는데, 이것은 올바른 표현이 아닙니다.
`&`와 `|`는 논리 연산자(logical operators)입이다. `&`은 논리 곱인 (AND)를 의미하고,  `|`은 논리 합인 (OR)를 연산합니다. 논리 연산자는 `논리 참`인 `TRUE`와 `논리 거짓`인 `FALSE`를 `피연산자로 사용`하는 연산자입니다. 연산자 우선 순위 중 비교 연산자가 논리 연산자보다 앞서므로, 비교 연산자의 표현식이 먼저 수행되어 논리 참/거짓을 반환하고, 이를 피연사자로 삼아서 논리 연산자가 수행되는 것입니다. 나중에 수행되는 논리 연산자가 마치 앞과 뒤의 비교 연산자를 결합하는 구조로 보여, 결합 연산자라 표현한 것 같습니다. (그러나 이 학습에서는 원문의 오류는 잡지만, 원 저작자의 의견을 존중하는 차원에서 원 저작자의 표현을 그대로 사용하였습니다.)

### 학습 지침

+ `&`를 사용해서 다른 표현식 `person_of_color == FALSE`을 연결합니다.
+ 필터링 결과가 몇 건의 관측치를 반환하는지 출력하세요. 

<codeblock id="03_05">
</codeblock></exercise>

<exercise id="6" title="비교 연산의 연결 퀴즈">

<codeblock id = "03_06">
</codeblock>

어떤 필터링이 더 많은 건수의 부분집합을 반환할까요? 잘 모르겠으면 콘솔을 실행해 보세요.

<choice>
<opt text="filter(biopics, year_release > 1980 & type_of_subject == 'Criminal')">두 가지 기준을 모두 적용하므로 이 부분 집합이 더 작습니다.
</opt>
<opt text="filter(biopics, year_release > 1980 | type_of_subject == 'Criminal')" correct="true">논리 합(OR, `|`)을 사용하면, 논리 곱보다 부분집합이 더 커집니다.  
</opt></choice>
</exercise>

<exercise id="7" title="%in% 연산자">

범주형 변수에서 여러 범주(수준, levels)를 선택하려면 어떻게 할까요? 다음처럼 `%in%` 연산자를 사용하면 됩니다.
선택해야할 여러 값들은 `c()` 함수를 사용해서 `벡터`로 만들어야 합니다. 그리고 값을 매치하기 위해서 선택해야하는 값은 정확해야 하며, 대소문자를 구분하니 대소문자도 일치해야 합니다. ("UK", "Uk", "uk"는 서로 다른 값입니다)

```{r}
biopicsUSUK <- biopics %>% filter(country %in% c("US", "UK"))
```

### 학습 지침

+ `type_of_subject` 변수의 값이 `Musician`, `Artist`, `Singer`인 영화를 추출합니다. 
+ 추출한 결과를 `biopicsArt`에 할당하세요.


<codeblock id="03_07">
</codeblock></exercise>

<exercise id="8" title="결측치 제거">

`filter()`를 활용할 수 있는 트릭 중에 결측치를 제거하는 것이 있습니다. R 데이터에서 결측치는 `NA`로 표현합니다. 당신은 `is.na()`를 이용해서 `NA`가 포함된 데이터를 제거할 수 있습니다. 
예를 들면 다음과 같습니다.:

```{r}
filter(biopics, !is.na(box_office))
```

is.na(box_office) 앞에 있는 !는 논리 부정(NOT)을 나타내는 논리 연산자입니다. 이것은 is.na 구문의 결과에서 모든 TRUE를 FALSE로, 모든 FALSE를 TRUE로 바꿉니다. 
NA가 아닌 모든 것을 유지하고 싶어서 논리 부정 연산자 !를 사용하는 것입니다.

### 학습 지침

+ `biopics`에서 NA를 제거하는 필터링을 수행하세요,그리고 결과를 `filteredBiopics`에 할당합니다.
+ `biopics`의 건수와 `filteredBiopics`의 건수를 비교합니다. 
+ 몇 건의 결측치를 제거했나요?



<codeblock id="03_08">
</codeblock></exercise>

<exercise id="9" title="dplyr::mutate()">

`mutate()`는 `dplyr`에서 유용한 기능 중 하나입니다. 당신은 이 기능을 통해서 데이터(`데이터 프레임`에서의 변수)를 변환하고, 그것을 새로운 변수 이름으로 `데이터 프레임`에 추가할 수 있습니다.
예를 들어, `box_office`을 `number_of_subjects`로 나누어 표준화 시킨 값을 `normalized_box_office`에 할당합니다: 

```{r}
biopics2 <- mutate(biopics, normalized_box_office = box_office/number_of_subjects)
```
여기서 우리는 무슨 작업을 수행했을까요? 
우리는 `mutate()` 함수를 사용하여 `normalized_box_office`라는 새로운 열을 `데이터 프레임`에 추가했습니다.
이 신규 변수는 모든 행(관측치)에 대해서 `box_office`을 `number_of_subjects`로 나눈 값으로 만들어집니다.

### 학습 지침

+ `subject_race`와 `subject_sex`의 문자열을 묶어서 신규 변수 `race_and_gender`을 파생합니다. 그리고 `biopics2`라는 이름의 새로운 `데이터 프레임`을 만드세요.
+ 신규로 파생된 변수가 정확하게 만들어졌는지 확인하기 위해 `head()` 함수로 앞의 몇 건을 조회하세요.

두 개의 문자열을 묶기 위해서는 `paste()` 함수를 사용하면 됩니다.

<codeblock id="03_09">
`paste(subject_race, subject_sex)`
</codeblock>
</exercise>

<exercise id="10" title="파생한 변수를 바로 사용할 수 있습니다!">

`mutate()`의 가장 큰 특징이자 장점은,  `mutate()` 구문에서 생성한 신규 변수를 구문 안에서 바로 사용할 수 있다는 것입니다. 다음 코드로 확인해 보세요.:

```{r}
mutate(biopics, 
    box_office_year = year_release * box_office, 
    box_office_subject = paste0(box_office_year, subject))
```

`mutate()` 구문의 첫번 째 영역에서 `box_office_year`을 정의하였고, 바로 이것을 두번 째 영역에서 `box_office_subject` 변수를 만드는 데 사용했습니다.

(역자 주) 이 기능은 한번의 `mutate()` 함수의 호출에서 여러 변수를 파생할 수 있다는 것을 의미합니다. 그리고 기술한 표현식의 순서대로 변수가 만들어지며, 후 순위의 표현식에서는 선 순위에 만들어진 변수를 사용할 수 있습니다. `mutate()`의 이 기능은 실무에서 유용하게 응용됩니다. 한번의 함수 호출에서 순차적으로 새로운 변수를 만들면, 불필요한 반복적인 연산을 줄일 수 있기 때문입니다. 데이터를 조작 전문 도구인 SQL이나 여러 툴에서 지원하지 않는 기능입니다.

### 학습 지침

+ 하나의 `mutate()` 구문에서 먼저 만들어진 `box_office_year` 변수를 `number_of_subjects`로 나눠 `box_office_y_s_num`라는 신규 변수를 정의합니다.
+ 결과를 `mutatedBiopics`에 할당합니다.

<codeblock id="03_10">
Add `box_office_y_s_num=box_office_year/number_of_subjects` to the statement below.
</codeblock>
</exercise>

<exercise id="11" title="`mutate()`의 또다른 용도">

아래 코드는 어떤 작업을 수행할까요? 잘 모르겠으면 콘솔에서 한 번 실행해보세요.


```{r}
mutate(biopics, subject = paste(subject, year_release))
```

<codeblock id="03_11">
</codeblock>

<choice>
<opt text="데이터 세트에서 동일한 이름을 가진 새로운 변수를 정의하고, 이전 변수도 유지합니다.">
한 번 실행해보세요. 우리가 변수를 하나 더 추가했나요?</opt>
<opt text="변수 `subject`를 변형하고 그 결과를 다시 `subject`에 넣습니다." correct="true">
굉장합니다! 이제 `mutate()`를 사용해서 기존 변수의 값을 변경할 수 있음을 알았습니다.</opt>
</choice>
</exercise>

<exercise id="12" title="`filter()`와 `mutate()`의 차이점">

이 두 코드의 차이점은 무엇인가요? 잘 모르겠으면 콘솔에서 한 번 실행해보세요.

```{r}
biopics %>% 
    filter(year_release > 1998) %>% 
    head()
```

```{r}
biopics %>% 
    mutate(isNewer = year_release > 1998) %>% 
    head()
```
<codeblock id = "03_12">
</codeblock>
 
<choice>
<opt text="첫 번째 코드는 데이터를 필터링하는 반면 두 번째 코드는 새 부울(boolean) 변수를 정의합니다." correct="true">플래그를 지정하는 데 사용할 수 있는 새로운 변수를 정의합니다.
</opt>
<opt text="두 번째 코드가 더 복잡합니다.">
    아닙니다.! 코드의 행 수를 비교해 보세요.
</opt>
</choice>
</exercise>

<exercise id="13" title="파이프 연산자: %>%">

`dplyr` 문법의 또 다른 한 부분인 `%>%`연산자를 소개합니다. `%>%`을 `파이프 연산자(pipe operator)`라 부릅니다. `ggplot2` 구문에서의 `+`와 비슷한 기능을 한다고 생각하면 됩니다.

`%>%` 연산자는 앞 구문 실행 결과인 출력값을 가져다가 다음 구문의 입력값으로 사용합니다. 그러므로 파이프 연산자를 사용한 아래 구문은,

```{r}
biopics %>% filter(race_known == "Known") %>%
    mutate(poc_code = as.numeric(person_of_color))
```
다음처럼 해석할 수 있습니다.: 
- `biopics` 데이터를, 
- `filter()`에 보내서, 입력받은 데이터에 `race_known == "Known"` 조건의 필터 연산을 수행한 후 그 결과를, 
- `mutate()`에 보내서, 입력받은 데이터로 `poc_code` 라는 새 변수를 정의합니다.

파이프 연산을 적용하면, `filter()`에 `data` 인수를 기술하지 않습니다. 왜냐하면 `data` 인수값은 파이프에 의해서 `filter()`에 자동으로 공급되기 때문입니다. `mutate()`도 마찬가지입니다.

`tidyverse`의 파이프 연산자 `%>%`는 `tidyverse` 패키지군의 여러 함수를 연결할 수 있습니다. 이것은 `tidyverse`의 가장 강력한 기능 중의 하나입니다. 

어떤 처리를 수행하는 작업의 표준화된 연결을 **파이프라인(pipeline)**이라 합니다. 데이터 조작을 하는 일련의 과정을 파이프라인으로 만드는 것은 좋은 시도입니다. 수신 데이터에 파이프라인을 적용하면 `ggplot2`과 유사한 방법으로, 동일한 포맷을 갖는 데이터를 출력으로 보낼 수 있습니다.

(역자 주) **파이프라인(pipeline)**은 마치 여러 개의 파이프를 연결하여 송유관을 만드는 작업과 유사합니다. 여러 마디의 파이프를 심리스(Seamless, 끊김없이 매끄럽게)하게 연결하여 원하는 장소에 안정하게 원유를 공급하는 송유관 공사를 연상하면 쉽습니다. 즉, 앞 마디의 파이프를 통과(출력)한 원유가 다음 마디의 파이프에 유입(입력)되는 과정을 거쳐서 최종 목적지로 원유를 운반하는 것처럼, 여러 데이터 조작 작업이 연결되어 최종 원하는 데이터를 생성하는 것입니다. 


### 학습 지침

+ `%>%`을 사용해서 `filter`에 `biopics`을 연결한 후 (`country=="US"`) 조건을 대입하세요. 

<codeblock id="03_13">
</codeblock>
</exercise>

<exercise id="14" title="group_by()/summarize()">

`group_by()`는 스스로 아무것도 하지 않습니다. 그러나 `summarize()`와 함께 사용하여, 그룹별로 메트릭(metrics, 최솟값, 최댓값, 평균, 표준편차와 같은 통계 지표)을 계산할 수 있습니다. 다음 예를 보세요.:

```{r}
countryMeans <- biopics %>% 
                    filter(!is.na(box_office)) %>% 
                    group_by(country) %>% 
                    summarize(mean_box_office = mean(box_office))
```

여기서 우리는 `country`별로 `box_office`의 평균을 구하려 합니다. 그러기 위해서 우리는 먼저, 집계를 작업의 방해 요소인 결측치(NA)가 있는 행(관측치)을 제거해야 합니다. 

어려운 질문 하나 하겠습니다. 범주형 변수인 `subject_sex`의 두 범주(수준, levels)의 `box_office` 평균은 차이가 있습니까? 

### 학습 지침

먼저 `filter()`로 NA를 제거합니다. 그런 다음, `group_by()`와 `summarize()`로 `subject_sex`별  `box_office`의 평균을 계산하여 `mean_bo_by_gender` 이름의 변수를 만듭니다. 마지막으로 결과를 `gender_box_office`에 할당합니다. 

<codeblock id="03_14">
</codeblock>
</exercise>

<exercise id="15" title="건수 세기">

다음 코드는 무슨 작업을 수행할까요? 콘솔에서 실행해 보세요!

```{r}
biopics %>% group_by(type_of_subject) %>% summarize(count=n())
```

<codeblock id="03_15">
</codeblock>


<choice>
<opt text="단지 `biopics` 데이터 프레임을 보여줍니다.">
 실행해 보고 어떤 작업을 수행하는지 확인해보세요.</opt>
<opt text="`type_of_subject`의 범주별 건수를 계산하고, 그 결과를 집계 테이블에 넣습니다." correct="true">이제 `group_by()`와 `summarize()`를 사용하여 범주별로 데이터 건수를 계산하는 방법을 알게 되었습니다.
</opt>
</choice>
</exercise>

<exercise id="16" title="arrange()">

`arrange()`는 지정한 변수를 기준으로 데이터를 정렬합니다. 만약 여러 개의 변수를 지정하면, 지정한 변수의 배열을 기준으로 정렬합니다. 예를 들어:

```{r}
biopics %>% arrange(country, year_release)
```

이 구문은 먼저 `country` 기준으로 정렬한 다음에, 정렬된 `country` 범주안에서 `year_release` 기준으로 정렬합니다.

### 학습 지침

`biopics`를 `year_release`, `country`를 기준으로 정렬합니다. 그리고 결과를 `biopics_sorted`에 할당합니다.

<codeblock id="03_16">
</codeblock></exercise>

<exercise id="17" title="select()">

우리가 배울 마지막 함수는 `select()`입니다. `select()`로 다음을 수행할 수 있습니다.: 

1) 컬럼 추출
2) 컬럼의 순서 변경
3) 데이터에서 컬럼 제거 
4) 데이터에서 컬럼 이름 변경 

예를 들어, 다음 코드를 보세요.:

```{r}
biopics %>% select(movieTitle = title, box_office)
```
이 코드는 두 개의 컬럼(`title_of_movie`, `box_office`)만 추출합니다. 그리고 추출한 `title`의 이름을 `movieTitle`로 변경합니다.

### 학습 지침

+ `select()`로 `title`, `box_office`, `subject_sex` 변수를 추출하세요.
+ 이때, 추출한 `title`의 이름을 `movieTitle`로 변경하세요. 
+ 추출한 결과를 `threeVarTable`에 할당하세요.

<codeblock id="03_17">
</codeblock></exercise>

<exercise id="18" title="`select()`와 `filter()` 비교">

`select()`와 `filter()의 차이점은 무엇입니까?`

<choice>
<opt text="`select()`는 부울(booleans)에서 작동하는 반면, `filter()`는 모든 데이터 유형에서 작동합니다.">이 두 함수를 사용하는데, 데이터 유형은 상관없습니다.
</opt>
<opt text="`select()`는 `filter()` 이후에만 작동합니다.">`select()`와 `filter()`는 순서에 상관없이 사용할 수 있습니다!
</opt>
<opt text="`select()`는 열에서 작동하고, `filter()`는 행에서 작동합니다." correct = "true">
`dplyr` 숭배 집단에 오신 것을 환영합니다! 당신의 비밀해독 반지는 우편물에 있습니다.
</opt>
</choice>
</exercise>

<exercise id="19" title="도전 1: 함수들을 통합하기">

이제 재미있는 작업에 도전합니다. 데이터 정제 및 변수 변환을 수행하기 위해서 `dplyr` 함수들을 묶어나가겠습니다.

당신은 이 작업을 수행하는 동안 [`dplyr` 치트 시트](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)를 참고해도 됩니다.

### 학습 지침

+ `biopics` 데이터에서, `filter()`를 사용해서 2000년부터 2014년까지 개봉된 영화를 추립니다. (`year_release` 변수가 필요할 것입니다.)
+ 필터링하여 `box_office`에서 NA가 포함된 행을 제거합니다.
+ `mutate()`를 수행하여 신규 파생변수 `box_office_per_subject`를 생성합니다. (이 작업에 필요한 변수는 `box_office`와 `number_of_subjects`입니다.)
+ 수행한 결과를 `biopics_new`에 할당합니다.
+ `biopics_new`에 대해서 `summary()`를 수행해서 작업이 정상적으로 수행되었는지 확인합니다.

<codeblock id="03_19">
</codeblock></exercise>

<exercise id="20" title="도전 2: 실적 보이기">

인종이 국가별로 분류된(`race_known` == TRUE) 영화가 분류되지 않은(`race_known`== FALSE) 영화보다 더 많은 돈을 벌 수 있을까요?
어떤 `race_known`/`country`의 조합이 가장 많은 수익을 올렸습니까?

### 학습 지침

+ 당신은 다른 작업에 앞서, 제일 먼저 `filter()` 작업으로 `box_office`가 `NA`인 행을 제거해야 합니다.
+ 그리고 어떤 변수가 `group_by()`에 필요한지 생각해 보세요. 
+ 마지막으로, 원하는 집계를 생성하는 `summarize()`를 수행합니다. (집계된 통계량을 `mean_box_office`에 할당합니다.) 
and `arrange` on (don't forget to use `desc`!)? 
+ 결과를 `race_country_box_office`에 할당하세요.
+ `race_country_box_office`을 조회하세요.



<codeblock id="03_20">
You can do this!</codeblock></exercise>

<exercise id="21" title="도전 3: ggplot2와 dplyr 함께 사용하기">

이제 우리는 아주 따끈한 요리를 만들 것입니다. 당신은 `dplyr`의 결과를 파이프라인을 통해서 `ggplot2` 구문으로 보낼 것입니다. 
다음 예를 보세요.:

```{r}
biopics %>%
    filter(year_release >= 2000 & year_release <= 2014) %>%
    mutate(box_office_per_subject = box_office / number_of_subjects) %>%
    ggplot(aes(x = year_release, y = box_office_per_subject)) +
    geom_point()
```

우리는 `%>%`를 사용해서 `dplyr` 구문을 `ggplot()`에 파이프링한다는 점에  유의해야 합니다. 기억해야 할  중요한 점은 `ggplot()` 함수 이후의 모든 구문들은 `+`로 연결해야 한다는 것입니다. `%>%`가 아닙니다.

또다른 참고: `ggplot()` 함수에서 `data` 인수에 값을 지정하지 않습니다. 단지 그것을 파이프로 전달받을 뿐입니다. 

`biopics`이 슬슬 지겨워지나요? 이 데이터 세트를 사용하는 것은 이번이 마지막이라 약속합니다.

### 학습 지침

+ 먼저, `biopics`의  `year_release` < 1990 조건으로 필터링합니다. 그리고 `box_office`의 값이 `NA`인 건을 제거합니다. 
+ 그리고 그결과를 파이프로, `box_office`을 x-y 좌표에 플로팅하는 `ggplot()` 구문에 넘겨줍니다. 
+ 기하학적 표현을 위해 인수값을 `x=year_release`, `y=log(box_office)`로 하는 `geom_point()`을 사용합니다.   
+ 포인트(점)의 색상은 `person_of_color`을 이용합니다. 
+ 시각화 결과를 `bPlot`에 저장합니다. 그리고 화면 출력을 위해서 `print(bPlot)`을 실행합니다.

<codeblock id="03_21">
</codeblock></exercise>

<exercise id="22" title="이 장에서 배운 내용">

- `%>%`(파이프)의 사용 방법
- `dplyr::filter()`
- `dplyr::mutate()`
- `dplyr::group_by()/dplyr::summarize()`
- `dplyr::arrange()`
- `dplyr::select()`
- 이들 함수를 함께 사용하는 방법!

이 챔터를 잘 마치셨습니다! 당신은 `tidyverse`의 닌자가 되는 길을 잘 헤쳐나가고 있습니다!

**추가 리소스**

- [데이터 변환](https://bookdown.org/sulgi/r4ds/data-transform.html), R을 활용한 데이터 과학(R for Data Science)의 이 장(챕터)도 `dplyr`의 기초를 배울 수 있는 좋은 길잡이입니다.
- [Pipes](https://r4ds.had.co.nz/pipes.html), R을 활용한 데이터 과학(R for Data Science)의 이 장(챕터)에서는 워크플로우에서 파이프를 사용해야 하는 이유에 대해서 자세하게 설명합니다.
</exercise>

