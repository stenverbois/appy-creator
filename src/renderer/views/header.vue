<style lang="less">
@import "./../../style/variables.less";

.header {
  display: flex;
  flex-direction: row;
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: @top-bar-height;
  background-color: lightblue;

  -webkit-user-select: none;
}
</style>

<template>
  <div class="header container-fluid">
    <div class="row">
      Header
    </div>
  </div>
</template>
