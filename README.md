# final_project-0712232
final_project-0712232 created by GitHub Classroom

# project : 任意給平面上三點，所畫出的三角形，判斷原點三個頂點的垂足是不是三角形裡面(或邊上)

input: 先按run，然後在螢幕的x,y平面上任意點三個點

output:

1.原點的點座標，三角形ABC的座標圖，三個頂點的垂足hA,hB,hC的座標圖

2. 判斷原點是不是在三角形內（或邊上）

3. 判斷hA, hB, hC是不是在三角形內（或邊上）

if在三角形內（邊上），該點會以綠色的X表示

if not，該點會以紅色的X表示


如果想繼續畫新的三角形，按一下左鍵，就可以重新在螢幕上任點三個點

如果想結束，按一下右鍵


### 判斷原點是不是在三角形裡面的想法:

已知平面上三角形ABC和一個原點O，然後把他們轉到三維空間

令a向量為OA向量和OB向量的外積

令b向量為OB向量和OC向量的外積

令c向量為OC向量和OA向量的外積

如果a,b,c向量的z方向都>=0或是<=0的話，則原點在三角形內(或邊上)



### 求出三個垂足的座標and判斷有沒有在三角形裡面的想法:

step1:求出三個垂足的座標

垂足hA: 利用通過B,C兩點的直線方程式，求出通過A點垂直於直線BC的方程式，再利用行列式求出x,y的解
       
垂足hB: 利用通過A,C兩點的直線方程式，求出通過B點垂直於直線AC的方程式，再利用行列式求出x,y的解
       
垂足hC: 利用通過B,A兩點的直線方程式，求出通過C點垂直於直線BC的方程式，再利用行列式求出x,y的解
       
step2:判斷有沒有在三角形裡面

利用1.(判斷原點是不是在三角形裡面的想法)

把原點換成hA,hB,hC就能知道在不在三角形裡

reference: Lecture - Approximating functions(InterpolateRungeFunction2)

