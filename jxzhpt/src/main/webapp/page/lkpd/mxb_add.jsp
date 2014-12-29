<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head id="Head1"><title>
	公路技术状况统计表
</title><link href="../Css/page.css" rel="stylesheet" type="text/css" /></head>
<body style="margin: 0px; overflow: auto;">
    <form name="form1" method="post" action="RoadAssessmentInfo_TJ.aspx?TitleID=5dd8acaa-a9f9-4a29-8b5a-38297ca51f8b&amp;t=1419817841806" id="form1">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTgxNjE0NTM5OQ9kFgICAw9kFhICAQ8PFgIeBFRleHQFKuKAlOWOv+mBk+OAgeS5oemBk+OAgeadkemBk+OAgeS4k+eUqOWFrOi3r2RkAgMPDxYCHwAF5AHooaggICAg5Y+377ya5LqkICDlhawgIOi3ryAgMjktMiDooaggICAgICAgICAgICAgIOWItuihqOacuuWFs++8muS6pCAg6YCaICDov5AgIOi+kyAgIOmDqCAgICAgICAgIOWkh+ahiOacuuWFs++8muWbvSAg5a62ICAg57ufIOiuoSAg5bGAICAgICAgICAg5om55YeG5paH5Y+377ya5Zu957uf5Yi277yIMjAxMu+8iTEzMeWPtyAgICAgICAg5pyJ5pWI5pyf6Iez77yaMjAxNCAg5bm0ICAgMTEgICDmnIhkZAIFDw8WAh8AZWRkAgcPDxYCHwAFBzIwMTPlubRkZAIJDxYCHglpbm5lcmh0bWwF2y88dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZCByb3dzcGFuPSc1JyBzdHlsZT0nd2lkdGg6MTEwcHg7Jz5NUUk8L3RkPjx0ZCBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7mgLvorqE8L3RkPjx0ZD4xPC90ZD48dGQ+NjEyMDAuNzQxPC90ZD48dGQ+MTgyNzEuNjc4PC90ZD48dGQ+MTY1ODEuNzQ0PC90ZD48dGQ+MTMyNTIuMDI4PC90ZD48dGQ+Njk2OS4wNDE8L3RkPjx0ZD42MTI2LjI1MDwvdGQ+PHRkPjU2Ljk0OTwvdGQ+PHRkPjc4LjY4MTwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZCBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7ljr/pgZM8L3RkPjx0ZD4yPC90ZD48dGQ+MjA0ODguNjY1PC90ZD48dGQ+NDM4My45MjQ8L3RkPjx0ZD42MzUxLjIwODwvdGQ+PHRkPjQ4NDkuMTU1PC90ZD48dGQ+MjQ5NS44ODE8L3RkPjx0ZD4yNDA4LjQ5NzwvdGQ+PHRkPjUyLjM5NTwvdGQ+PHRkPjc4LjEwMDwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZCBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7kuaHpgZM8L3RkPjx0ZD4zPC90ZD48dGQ+MjkyMDIuODA5PC90ZD48dGQ+NjEwNC44NTM8L3RkPjx0ZD45NTgzLjM5MzwvdGQ+PHRkPjY4NTYuNjg2PC90ZD48dGQ+MzkzNS44OTk8L3RkPjx0ZD4yNzIxLjk3ODwvdGQ+PHRkPjUzLjcyMjwvdGQ+PHRkPjc5LjEwMDwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZCBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7mnZHpgZM8L3RkPjx0ZD40PC90ZD48dGQ+MTEzMDcuNTY4PC90ZD48dGQ+NzY5Ny40MTY8L3RkPjx0ZD41NzguOTk1PC90ZD48dGQ+MTUzMS40OTM8L3RkPjx0ZD41MTIuMzc5PC90ZD48dGQ+OTg3LjI4NTwvdGQ+PHRkPjczLjE5NDwvdGQ+PHRkPjc4LjYwMDwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZCBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7kuJPnlKjlhazot688L3RkPjx0ZD41PC90ZD48dGQ+MjAxLjY5OTwvdGQ+PHRkPjg1LjQ4NTwvdGQ+PHRkPjY4LjE0ODwvdGQ+PHRkPjE0LjY5NDwvdGQ+PHRkPjI0Ljg4MjwvdGQ+PHRkPjguNDkwPC90ZD48dGQ+NzYuMTY5PC90ZD48dGQ+ODEuNTAwPC90ZD48L3RyPjx0ciBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogV2hpdGU7IGhlaWdodDoxNXB4OyI+PHRkIHJvd3NwYW49JzUnIHN0eWxlPSd3aWR0aDoxMTBweDsnPui3r+mdoihQUUkpPC90ZD48dGQgc3R5bGU9J3dpZHRoOjExMHB4Oyc+5oC76K6hPC90ZD48dGQ+NjwvdGQ+PHRkPjYxMjAwLjc0MTwvdGQ+PHRkPjEzNTg4LjU1OTwvdGQ+PHRkPjE4MDA4LjU3NDwvdGQ+PHRkPjE0MTk5LjgzMTwvdGQ+PHRkPjc4MzMuMjkzPC90ZD48dGQ+NzU3MC40ODQ8L3RkPjx0ZD41MS42Mjk8L3RkPjx0ZD43Ny4xOTE8L3RkPjwvdHI+PHRyIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiBXaGl0ZTsgaGVpZ2h0OjE1cHg7Ij48dGQgc3R5bGU9J3dpZHRoOjExMHB4Oyc+5Y6/6YGTPC90ZD48dGQ+NzwvdGQ+PHRkPjIwNDg4LjY2NTwvdGQ+PHRkPjQzMDguMzIwPC90ZD48dGQ+NTg0OS4zMjI8L3RkPjx0ZD40NjQwLjAzMzwvdGQ+PHRkPjI0NzAuMjUyPC90ZD48dGQ+MzIyMC43Mzg8L3RkPjx0ZD40OS41Nzc8L3RkPjx0ZD43Ni4xMDA8L3RkPjwvdHI+PHRyIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiBXaGl0ZTsgaGVpZ2h0OjE1cHg7Ij48dGQgc3R5bGU9J3dpZHRoOjExMHB4Oyc+5Lmh6YGTPC90ZD48dGQ+ODwvdGQ+PHRkPjI5MjAyLjgwOTwvdGQ+PHRkPjYyODIuMTE3PC90ZD48dGQ+ODY5My4xODU8L3RkPjx0ZD42NjAzLjAwNjwvdGQ+PHRkPjQyNjAuMzA0PC90ZD48dGQ+MzM2NC4xOTc8L3RkPjx0ZD41MS4yODA8L3RkPjx0ZD43Ny45MDA8L3RkPjwvdHI+PHRyIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiBXaGl0ZTsgaGVpZ2h0OjE1cHg7Ij48dGQgc3R5bGU9J3dpZHRoOjExMHB4Oyc+5p2R6YGTPC90ZD48dGQ+OTwvdGQ+PHRkPjExMzA3LjU2ODwvdGQ+PHRkPjI5NDMuMTQxPC90ZD48dGQ+MzM4OC41Mzc8L3RkPjx0ZD4yOTI1LjU0MzwvdGQ+PHRkPjEwNzkuMTg0PC90ZD48dGQ+OTcxLjE2MzwvdGQ+PHRkPjU1Ljk5NTwvdGQ+PHRkPjc3LjMwMDwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZCBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7kuJPnlKjlhazot688L3RkPjx0ZD4xMDwvdGQ+PHRkPjIwMS42OTk8L3RkPjx0ZD41NC45ODE8L3RkPjx0ZD43Ny41MzA8L3RkPjx0ZD4zMS4yNDk8L3RkPjx0ZD4yMy41NTM8L3RkPjx0ZD4xNC4zODY8L3RkPjx0ZD42NS42OTc8L3RkPjx0ZD43OS4zMDA8L3RkPjwvdHI+PHRyIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiBXaGl0ZTsgaGVpZ2h0OjE1cHg7Ij48dGQgcm93c3Bhbj0nNScgc3R5bGU9J3dpZHRoOjExMHB4Oyc+6Lev5Z+6KFNDSSk8L3RkPjx0ZCBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7mgLvorqE8L3RkPjx0ZD4xMTwvdGQ+PHRkPjYxMjAwLjc0MTwvdGQ+PHRkPjI3OTU4LjA3NjwvdGQ+PHRkPjg5NjUuMzYyPC90ZD48dGQ+ODYyMy44NTk8L3RkPjx0ZD41ODI5LjQyODwvdGQ+PHRkPjk4MjQuMDE2PC90ZD48dGQ+NjAuMzMyPC90ZD48dGQ+NzkuMTMwPC90ZD48L3RyPjx0ciBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogV2hpdGU7IGhlaWdodDoxNXB4OyI+PHRkIHN0eWxlPSd3aWR0aDoxMTBweDsnPuWOv+mBkzwvdGQ+PHRkPjEyPC90ZD48dGQ+MjA0ODguNjY1PC90ZD48dGQ+ODc1NC43NTY8L3RkPjx0ZD4zNTg4Ljk0MzwvdGQ+PHRkPjMwOTEuMjEyPC90ZD48dGQ+MjAxNC4zMTk8L3RkPjx0ZD4zMDM5LjQzNTwvdGQ+PHRkPjYwLjI0NjwvdGQ+PHRkPjc5LjUwMDwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZCBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7kuaHpgZM8L3RkPjx0ZD4xMzwvdGQ+PHRkPjI5MjAyLjgwOTwvdGQ+PHRkPjExNDUyLjYyNzwvdGQ+PHRkPjQ0OTkuNjU5PC90ZD48dGQ+NDQxMS4zMjk8L3RkPjx0ZD4yODU3LjY3NDwvdGQ+PHRkPjU5ODEuNTIwPC90ZD48dGQ+NTQuNjI2PC90ZD48dGQ+NzcuNTAwPC90ZD48L3RyPjx0ciBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogV2hpdGU7IGhlaWdodDoxNXB4OyI+PHRkIHN0eWxlPSd3aWR0aDoxMTBweDsnPuadkemBkzwvdGQ+PHRkPjE0PC90ZD48dGQ+MTEzMDcuNTY4PC90ZD48dGQ+NzYzMS43Nzc8L3RkPjx0ZD44MjUuNTM2PC90ZD48dGQ+MTEwNi4xMzM8L3RkPjx0ZD45NDkuNDk0PC90ZD48dGQ+Nzk0LjYyODwvdGQ+PHRkPjc0Ljc5MzwvdGQ+PHRkPjgyLjUwMDwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZCBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7kuJPnlKjlhazot688L3RkPjx0ZD4xNTwvdGQ+PHRkPjIwMS42OTk8L3RkPjx0ZD4xMTguOTE2PC90ZD48dGQ+NTEuMjI0PC90ZD48dGQ+MTUuMTg1PC90ZD48dGQ+Ny45NDE8L3RkPjx0ZD44LjQzMzwvdGQ+PHRkPjg0LjM1MzwvdGQ+PHRkPjg4LjUwMDwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZCByb3dzcGFuPSc1JyBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7moaXpmqfmnoTpgKDniakoQkNJKTwvdGQ+PHRkIHN0eWxlPSd3aWR0aDoxMTBweDsnPuaAu+iuoTwvdGQ+PHRkPjE2PC90ZD48dGQ+NjEyMDEuNzQxPC90ZD48dGQ+NDAzMjguMjQzPC90ZD48dGQ+MjYxOS45Njc8L3RkPjx0ZD4xOTY4LjE5ODwvdGQ+PHRkPjY0MTQuNTY3PC90ZD48dGQ+OTg3MC43NjY8L3RkPjx0ZD43MC4xNzU8L3RkPjx0ZD44Mi41ODU8L3RkPjwvdHI+PHRyIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiBXaGl0ZTsgaGVpZ2h0OjE1cHg7Ij48dGQgc3R5bGU9J3dpZHRoOjExMHB4Oyc+5Y6/6YGTPC90ZD48dGQ+MTc8L3RkPjx0ZD4yMDQ4OS42NjU8L3RkPjx0ZD4xNDMzNC4yNTM8L3RkPjx0ZD45NS40NDk8L3RkPjx0ZD44MDQuOTkwPC90ZD48dGQ+MjMyNi40MjQ8L3RkPjx0ZD4yOTI4LjU0OTwvdGQ+PHRkPjcwLjQyNDwvdGQ+PHRkPjgyLjEwMDwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZCBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7kuaHpgZM8L3RkPjx0ZD4xODwvdGQ+PHRkPjI5MjAyLjgwOTwvdGQ+PHRkPjIyMTM3LjU5MzwvdGQ+PHRkPjM3OC41NTI8L3RkPjx0ZD42MDUuNzcyPC90ZD48dGQ+MTg4NS43MjY8L3RkPjx0ZD40MTk1LjE2NjwvdGQ+PHRkPjc3LjEwMzwvdGQ+PHRkPjg0LjkwMDwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZCBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7mnZHpgZM8L3RkPjx0ZD4xOTwvdGQ+PHRkPjExMzA3LjU2ODwvdGQ+PHRkPjM3NDIuNDcxPC90ZD48dGQ+MjExNC4zMjY8L3RkPjx0ZD41NDIuODg2PC90ZD48dGQ+MjE3MS4zOTY8L3RkPjx0ZD4yNzM2LjQ4OTwvdGQ+PHRkPjUxLjc5NTwvdGQ+PHRkPjc3LjQwMDwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZCBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7kuJPnlKjlhazot688L3RkPjx0ZD4yMDwvdGQ+PHRkPjIwMS42OTk8L3RkPjx0ZD4xMTMuOTI2PC90ZD48dGQ+MzEuNjQwPC90ZD48dGQ+MTQuNTUwPC90ZD48dGQ+MzEuMDIxPC90ZD48dGQ+MTAuNTYyPC90ZD48dGQ+NzIuMTcwPC90ZD48dGQ+ODcuNDAwPC90ZD48L3RyPjx0ciBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogV2hpdGU7IGhlaWdodDoxNXB4OyI+PHRkIHJvd3NwYW49JzUnIHN0eWxlPSd3aWR0aDoxMTBweDsnPuayv+e6v+iuvuaWvShUQ0kpPC90ZD48dGQgc3R5bGU9J3dpZHRoOjExMHB4Oyc+5oC76K6hPC90ZD48dGQ+MjE8L3RkPjx0ZD42MTIwMC43NDE8L3RkPjx0ZD4zNDg3Mi43MzY8L3RkPjx0ZD4xMDAyMi42NzY8L3RkPjx0ZD41MDg0LjcyNjwvdGQ+PHRkPjQwOTIuMDMzPC90ZD48dGQ+NzEyOC41NzA8L3RkPjx0ZD43My4zNTg8L3RkPjx0ZD44NS44OTk8L3RkPjwvdHI+PHRyIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiBXaGl0ZTsgaGVpZ2h0OjE1cHg7Ij48dGQgc3R5bGU9J3dpZHRoOjExMHB4Oyc+5Y6/6YGTPC90ZD48dGQ+MjI8L3RkPjx0ZD4yMDQ4OC42NjU8L3RkPjx0ZD4xMjI1NC45NjE8L3RkPjx0ZD4yOTQxLjE4NzwvdGQ+PHRkPjE3MjAuNTgyPC90ZD48dGQ+MTE1OC40MDQ8L3RkPjx0ZD4yNDEzLjUzMTwvdGQ+PHRkPjc0LjE2OTwvdGQ+PHRkPjg1LjMwMDwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZCBzdHlsZT0nd2lkdGg6MTEwcHg7Jz7kuaHpgZM8L3RkPjx0ZD4yMzwvdGQ+PHRkPjI5MjAyLjgwOTwvdGQ+PHRkPjE4NDY4LjMwNzwvdGQ+PHRkPjMxOTQuNDUwPC90ZD48dGQ+MTk4NS41NjQ8L3RkPjx0ZD4xNDUwLjQ2MjwvdGQ+PHRkPjQxMDQuMDI2PC90ZD48dGQ+NzQuMTgwPC90ZD48dGQ+ODYuMjAwPC90ZD48L3RyPjx0ciBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogV2hpdGU7IGhlaWdodDoxNXB4OyI+PHRkIHN0eWxlPSd3aWR0aDoxMTBweDsnPuadkemBkzwvdGQ+PHRkPjI0PC90ZD48dGQ+MTEzMDcuNTY4PC90ZD48dGQ+NDAyNy44MTI8L3RkPjx0ZD4zODMwLjI1MTwvdGQ+PHRkPjEzNzIuMDYyPC90ZD48dGQ+MTQ3MS41NTg8L3RkPjx0ZD42MDUuODg1PC90ZD48dGQ+NjkuNDk0PC90ZD48dGQ+ODYuMTAwPC90ZD48L3RyPjx0ciBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogV2hpdGU7IGhlaWdodDoxNXB4OyI+PHRkIHN0eWxlPSd3aWR0aDoxMTBweDsnPuS4k+eUqOWFrOi3rzwvdGQ+PHRkPjI1PC90ZD48dGQ+MjAxLjY5OTwvdGQ+PHRkPjEyMS42NTY8L3RkPjx0ZD41Ni43ODg8L3RkPjx0ZD42LjUxODwvdGQ+PHRkPjExLjYwOTwvdGQ+PHRkPjUuMTI4PC90ZD48dGQ+ODguNDcwPC90ZD48dGQ+OTIuMDAwPC90ZD48L3RyPmQCCw8PFgIfAAWmAeWNleS9jei0n+i0o+S6uu+8miAgICAgICAgICAgICAgICAgICAgIOe7n+iuoei0n+i0o+S6uu+8miAgICAgICAgICAgICAgICAgICDloavooajkurrvvJogICAgICAgICAgICAgICAgICAg6IGU57O755S16K+d77yaICAgICAgICAgICAgICAgICAgIOaKpeWHuuaXpeacn++8mjIwMTQtMDEtMTVkZAINDw8WAh8ABRLnu5/orqHotJ/otKPkurrvvJpkZAIPDw8WAh8AZWRkAhEPDxYCHwBlZGRkn/q6wbMNaDCfz02CfZ0c9WZTtOo=" />
</div>

<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="2379952F" />
</div>
    <div style="text-align: left; vertical-align: top; margin: 0px; height: 99%;">
        <table border="0" style="margin-top: 1px; margin-left: 1px; width: 99.9%;" cellspacing="0"
            cellpadding="0">
            <tr>
                <td align="center" style="padding-top:5px;">
                    <table cellpadding="0" cellspacing="0" style="width: 950px;">
                        <tr style="height: 110px;">
                            <td>
                                <table cellpadding="0" cellspacing="0" style="width: 950px;">
                                    <tr>
                                        <td align="center" colspan="3" style="height: 20px; font-size: 20px; font-weight: bolder;">
                                            公路技术状况统计表
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 20%">
                                            &nbsp;
                                        </td>
                                        <td align="center" style="width: 50%; font-size: 14px;vertical-align:top;padding-top:10px;padding-left:30px;">
                                            <span id="lblFBT">—县道、乡道、村道、专用公路</span>
                                        </td>
                                        <td rowspan="2" align="right" style="width: 30%; margin: 0px; padding: 0px;">
                                            <textarea name="txtReport" rows="2" cols="20" readonly="readonly" id="txtReport" style="border-style:None;font-size:11px;height:90px;width:220px;overflow: hidden;">表    号：交  公  路  29-2 表              制表机关：交  通  运  输   部         备案机关：国  家   统 计  局         批准文号：国统制（2012）131号        有效期至：2014  年   11   月</textarea>
                                        </td>
                                    </tr>
                                    <tr style="vertical-align: bottom;">
                                        <td align="left" style="font-size: 12px;">
                                            填报单位：<span id="lblTBDW"></span>
                                        </td>
                                        <td align="center" style="font-size: 12px;">
                                            <span id="lblNF">2013年</span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">
                                <table cellpadding="1" cellspacing="1" style="vertical-align: middle; text-align: center;
                                    background-color: #4B4B4B">
                                    <tr style="background-color: #999999; height: 12px;">
                                        <td rowspan="2" colspan="2" style="width: 220px;">
                                            项目
                                        </td>
                                        <td rowspan="2" style="width: 30px;">
                                            编号
                                        </td>
                                        <td colspan="6" style="width: 540px;">
                                            实&nbsp; 际&nbsp; 评&nbsp; 级&nbsp; 里&nbsp; 程 （公里）
                                        </td>
                                        <td rowspan="2" style="width: 80px;">
                                            优良路率<br />
                                            (%)
                                        </td>
                                        <td rowspan="2" style="width: 80px;">
                                            评定结果
                                        </td>
                                    </tr>
                                    <tr style="background-color: #999999; height: 12px;">
                                        <td style="width: 100px;">
                                            合计
                                        </td>
                                        <td style="width: 100px;">
                                            优等路
                                        </td>
                                        <td style="width: 100px;">
                                            良等路
                                        </td>
                                        <td style="width: 100px;">
                                            中等路
                                        </td>
                                        <td style="width: 100px;">
                                            次等路
                                        </td>
                                        <td style="width: 100px;">
                                            差等路
                                        </td>
                                    </tr>
                                    <tr style="background-color: #999999; height: 15px;">
                                        <td colspan="2">
                                            甲
                                        </td>
                                        <td>
                                            乙
                                        </td>
                                        <td>
                                            1
                                        </td>
                                        <td>
                                            2
                                        </td>
                                        <td>
                                            3
                                        </td>
                                        <td>
                                            4
                                        </td>
                                        <td>
                                            5
                                        </td>
                                        <td>
                                            6
                                        </td>
                                        <td>
                                            7
                                        </td>
                                        <td>
                                            8
                                        </td>
                                    </tr>
                                    <div id="trContent"><tr style="background-color: White; height:15px;"><td rowspan='5' style='width:110px;'>MQI</td><td style='width:110px;'>总计</td><td>1</td><td>61200.741</td><td>18271.678</td><td>16581.744</td><td>13252.028</td><td>6969.041</td><td>6126.250</td><td>56.949</td><td>78.681</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>县道</td><td>2</td><td>20488.665</td><td>4383.924</td><td>6351.208</td><td>4849.155</td><td>2495.881</td><td>2408.497</td><td>52.395</td><td>78.100</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>乡道</td><td>3</td><td>29202.809</td><td>6104.853</td><td>9583.393</td><td>6856.686</td><td>3935.899</td><td>2721.978</td><td>53.722</td><td>79.100</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>村道</td><td>4</td><td>11307.568</td><td>7697.416</td><td>578.995</td><td>1531.493</td><td>512.379</td><td>987.285</td><td>73.194</td><td>78.600</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>专用公路</td><td>5</td><td>201.699</td><td>85.485</td><td>68.148</td><td>14.694</td><td>24.882</td><td>8.490</td><td>76.169</td><td>81.500</td></tr><tr style="background-color: White; height:15px;"><td rowspan='5' style='width:110px;'>路面(PQI)</td><td style='width:110px;'>总计</td><td>6</td><td>61200.741</td><td>13588.559</td><td>18008.574</td><td>14199.831</td><td>7833.293</td><td>7570.484</td><td>51.629</td><td>77.191</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>县道</td><td>7</td><td>20488.665</td><td>4308.320</td><td>5849.322</td><td>4640.033</td><td>2470.252</td><td>3220.738</td><td>49.577</td><td>76.100</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>乡道</td><td>8</td><td>29202.809</td><td>6282.117</td><td>8693.185</td><td>6603.006</td><td>4260.304</td><td>3364.197</td><td>51.280</td><td>77.900</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>村道</td><td>9</td><td>11307.568</td><td>2943.141</td><td>3388.537</td><td>2925.543</td><td>1079.184</td><td>971.163</td><td>55.995</td><td>77.300</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>专用公路</td><td>10</td><td>201.699</td><td>54.981</td><td>77.530</td><td>31.249</td><td>23.553</td><td>14.386</td><td>65.697</td><td>79.300</td></tr><tr style="background-color: White; height:15px;"><td rowspan='5' style='width:110px;'>路基(SCI)</td><td style='width:110px;'>总计</td><td>11</td><td>61200.741</td><td>27958.076</td><td>8965.362</td><td>8623.859</td><td>5829.428</td><td>9824.016</td><td>60.332</td><td>79.130</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>县道</td><td>12</td><td>20488.665</td><td>8754.756</td><td>3588.943</td><td>3091.212</td><td>2014.319</td><td>3039.435</td><td>60.246</td><td>79.500</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>乡道</td><td>13</td><td>29202.809</td><td>11452.627</td><td>4499.659</td><td>4411.329</td><td>2857.674</td><td>5981.520</td><td>54.626</td><td>77.500</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>村道</td><td>14</td><td>11307.568</td><td>7631.777</td><td>825.536</td><td>1106.133</td><td>949.494</td><td>794.628</td><td>74.793</td><td>82.500</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>专用公路</td><td>15</td><td>201.699</td><td>118.916</td><td>51.224</td><td>15.185</td><td>7.941</td><td>8.433</td><td>84.353</td><td>88.500</td></tr><tr style="background-color: White; height:15px;"><td rowspan='5' style='width:110px;'>桥隧构造物(BCI)</td><td style='width:110px;'>总计</td><td>16</td><td>61201.741</td><td>40328.243</td><td>2619.967</td><td>1968.198</td><td>6414.567</td><td>9870.766</td><td>70.175</td><td>82.585</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>县道</td><td>17</td><td>20489.665</td><td>14334.253</td><td>95.449</td><td>804.990</td><td>2326.424</td><td>2928.549</td><td>70.424</td><td>82.100</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>乡道</td><td>18</td><td>29202.809</td><td>22137.593</td><td>378.552</td><td>605.772</td><td>1885.726</td><td>4195.166</td><td>77.103</td><td>84.900</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>村道</td><td>19</td><td>11307.568</td><td>3742.471</td><td>2114.326</td><td>542.886</td><td>2171.396</td><td>2736.489</td><td>51.795</td><td>77.400</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>专用公路</td><td>20</td><td>201.699</td><td>113.926</td><td>31.640</td><td>14.550</td><td>31.021</td><td>10.562</td><td>72.170</td><td>87.400</td></tr><tr style="background-color: White; height:15px;"><td rowspan='5' style='width:110px;'>沿线设施(TCI)</td><td style='width:110px;'>总计</td><td>21</td><td>61200.741</td><td>34872.736</td><td>10022.676</td><td>5084.726</td><td>4092.033</td><td>7128.570</td><td>73.358</td><td>85.899</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>县道</td><td>22</td><td>20488.665</td><td>12254.961</td><td>2941.187</td><td>1720.582</td><td>1158.404</td><td>2413.531</td><td>74.169</td><td>85.300</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>乡道</td><td>23</td><td>29202.809</td><td>18468.307</td><td>3194.450</td><td>1985.564</td><td>1450.462</td><td>4104.026</td><td>74.180</td><td>86.200</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>村道</td><td>24</td><td>11307.568</td><td>4027.812</td><td>3830.251</td><td>1372.062</td><td>1471.558</td><td>605.885</td><td>69.494</td><td>86.100</td></tr><tr style="background-color: White; height:15px;"><td style='width:110px;'>专用公路</td><td>25</td><td>201.699</td><td>121.656</td><td>56.788</td><td>6.518</td><td>11.609</td><td>5.128</td><td>88.470</td><td>92.000</td></tr></div>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 20px;">
                            <td>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center" style="width: 25%;">
                                            <span id="lblDWFZR">单位负责人：                     统计负责人：                   填表人：                   联系电话：                   报出日期：2014-01-15</span>
                                        </td>
                                        <td align="center" style="width: 25%;">
                                            <span id="lblTJFZR">统计负责人：</span>
                                        </td>
                                        <td align="center" style="width: 25%;">
                                            <span id="lblTBR"></span>
                                        </td>
                                        <td align="center" style="width: 25%;">
                                            <span id="lblTBSJ"></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
