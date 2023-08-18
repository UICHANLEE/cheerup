import { createStore } from "vuex";
// import axios from "axios";
// import store from "@/store.js";

export default createStore({
  state: { loginSuccess: false, userId: "", userPw: "", token: null },

  mutations: {
    login(state, resData) {
      state.userId = resData.userId;
      state.userPw = resData.userPw;

      state.token = resData.token;
      state.loginSuccess = true;
    },

    logout(state) {
      state.userId = "";
      state.userPw = "";

      state.token = null;
      state.loginSuccess = false;
    },
  },
  actions: {},
  modules: {},
});

//header로 로그인상태 보내기

// axios
//   .get("http://localhost:8080/", {
//     headers: {
//       Authorization: "Bearer " + store.state.token, // 수정
//     },
//   })
//   .then((res) => {
//     this.sampleData = res.data;
//   })
//   .catch((err) => {
//     console.log(err);
//   });
