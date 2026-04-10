# Build URLs for specific PHIVOLCS earthquake bulletin summaries

Build URLs for specific PHIVOLCS earthquake bulletin summaries

## Usage

``` r
eq_build_url(
  .url = "https://earthquake.phivolcs.dost.gov.ph/",
  .year = NULL,
  .month = NULL
)
```

## Arguments

- .url:

  Base URL for PHIVOLCS earthquake bulletin summaries.

- .year:

  A vector for year (in YYYY format) for which earthquake bulletins are
  to be retrieved. The earliest year that can be specified is 2018. If
  set to NULL (default), all years starting from 2018 to present year
  are used.

- .month:

  A vector for month for which earthquake bulletins are to be retrieved.
  This can be set as either an integer index (1 for January) or
  abbreviation (Jan for January) for full name. If set to NULL
  (default), all months are used.

## Value

A vector of URLs based on given `.year` and `.month`

## Examples

``` r
eq_build_url()
#>   [1] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2018/2018_January.html"  
#>   [2] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2018/2018_February.html" 
#>   [3] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2018/2018_March.html"    
#>   [4] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2018/2018_April.html"    
#>   [5] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2018/2018_May.html"      
#>   [6] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2018/2018_June.html"     
#>   [7] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2018/2018_July.html"     
#>   [8] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2018/2018_August.html"   
#>   [9] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2018/2018_September.html"
#>  [10] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2018/2018_October.html"  
#>  [11] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2018/2018_November.html" 
#>  [12] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2018/2018_December.html" 
#>  [13] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2019/2019_January.html"  
#>  [14] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2019/2019_February.html" 
#>  [15] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2019/2019_March.html"    
#>  [16] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2019/2019_April.html"    
#>  [17] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2019/2019_May.html"      
#>  [18] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2019/2019_June.html"     
#>  [19] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2019/2019_July.html"     
#>  [20] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2019/2019_August.html"   
#>  [21] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2019/2019_September.html"
#>  [22] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2019/2019_October.html"  
#>  [23] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2019/2019_November.html" 
#>  [24] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2019/2019_December.html" 
#>  [25] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2020/2020_January.html"  
#>  [26] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2020/2020_February.html" 
#>  [27] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2020/2020_March.html"    
#>  [28] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2020/2020_April.html"    
#>  [29] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2020/2020_May.html"      
#>  [30] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2020/2020_June.html"     
#>  [31] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2020/2020_July.html"     
#>  [32] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2020/2020_August.html"   
#>  [33] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2020/2020_September.html"
#>  [34] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2020/2020_October.html"  
#>  [35] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2020/2020_November.html" 
#>  [36] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2020/2020_December.html" 
#>  [37] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2021/2021_January.html"  
#>  [38] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2021/2021_February.html" 
#>  [39] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2021/2021_March.html"    
#>  [40] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2021/2021_April.html"    
#>  [41] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2021/2021_May.html"      
#>  [42] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2021/2021_June.html"     
#>  [43] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2021/2021_July.html"     
#>  [44] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2021/2021_August.html"   
#>  [45] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2021/2021_September.html"
#>  [46] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2021/2021_October.html"  
#>  [47] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2021/2021_November.html" 
#>  [48] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2021/2021_December.html" 
#>  [49] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2022/2022_January.html"  
#>  [50] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2022/2022_February.html" 
#>  [51] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2022/2022_March.html"    
#>  [52] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2022/2022_April.html"    
#>  [53] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2022/2022_May.html"      
#>  [54] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2022/2022_June.html"     
#>  [55] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2022/2022_July.html"     
#>  [56] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2022/2022_August.html"   
#>  [57] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2022/2022_September.html"
#>  [58] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2022/2022_October.html"  
#>  [59] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2022/2022_November.html" 
#>  [60] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2022/2022_December.html" 
#>  [61] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2023/2023_January.html"  
#>  [62] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2023/2023_February.html" 
#>  [63] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2023/2023_March.html"    
#>  [64] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2023/2023_April.html"    
#>  [65] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2023/2023_May.html"      
#>  [66] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2023/2023_June.html"     
#>  [67] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2023/2023_July.html"     
#>  [68] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2023/2023_August.html"   
#>  [69] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2023/2023_September.html"
#>  [70] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2023/2023_October.html"  
#>  [71] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2023/2023_November.html" 
#>  [72] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2023/2023_December.html" 
#>  [73] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2024/2024_January.html"  
#>  [74] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2024/2024_February.html" 
#>  [75] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2024/2024_March.html"    
#>  [76] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2024/2024_April.html"    
#>  [77] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2024/2024_May.html"      
#>  [78] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2024/2024_June.html"     
#>  [79] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2024/2024_July.html"     
#>  [80] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2024/2024_August.html"   
#>  [81] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2024/2024_September.html"
#>  [82] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2024/2024_October.html"  
#>  [83] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2024/2024_November.html" 
#>  [84] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2024/2024_December.html" 
#>  [85] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2025/2025_January.html"  
#>  [86] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2025/2025_February.html" 
#>  [87] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2025/2025_March.html"    
#>  [88] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2025/2025_April.html"    
#>  [89] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2025/2025_May.html"      
#>  [90] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2025/2025_June.html"     
#>  [91] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2025/2025_July.html"     
#>  [92] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2025/2025_August.html"   
#>  [93] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2025/2025_September.html"
#>  [94] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2025/2025_October.html"  
#>  [95] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2025/2025_November.html" 
#>  [96] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2025/2025_December.html" 
#>  [97] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2026/2026_January.html"  
#>  [98] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2026/2026_February.html" 
#>  [99] "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2026/2026_March.html"    
#> [100] "https://earthquake.phivolcs.dost.gov.ph/"                                         
```
