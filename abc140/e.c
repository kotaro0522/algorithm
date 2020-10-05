#include <stdio.h>
#include <stdlib.h>
int compare(const void *a,const void *b){
    return *(int*)b-*(int*)a;
}
int main(){
    int n, x, y, ans;
    int p[10 * 10 * 10 * 10 * 10 + 999];
    int arr[3];
    scanf("%d",&n);
    for(int i=0;i<n;i++)scanf("%d",&p[i]);

    for(int l=1;l<=n-1;l++){
      x = p[l-1];
      y = -1;
      for(int r=l+1;r<=n;r++){
        arr[0] = x;
        arr[1] = y;
        arr[2] = p[r-1];
        qsort(arr,3,4,compare);
        y = arr[1];
        x = arr[0];
        ans += y;
      }
    }
    printf("%d\n",ans);
    return 0;
}

