# TableViewFloat

tableView滑动悬停

```
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
   if (scrollView == self.tableView) {

      CGFloat bottomCellOffset = [self.tableView rectForSection:1].origin.y - (STATUS_HEIGHT+44);
      bottomCellOffset = floorf(bottomCellOffset);

      if (scrollView.contentOffset.y >= bottomCellOffset) {
         scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
         if (self.canScroll) {
            self.canScroll = NO;
            self.containerCell.objectCanScroll = YES;
         }
         }else{
            //子视图没到顶部
            if (!self.canScroll) {
            scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
         }
      }
   }
}
```

![参考](https://github.com/XueYangLee/TableViewFloat/blob/master/screen.gif)
