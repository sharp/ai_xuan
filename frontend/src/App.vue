<script setup>
import { NGrid, NGi, NSpace, NAlert, NButton, NMessageProvider } from 'naive-ui'
import { onMounted, ref, computed } from "vue";
import { useRouter } from 'vue-router'
import { useStorage } from '@vueuse/core'

const state_jwt = useStorage('jwt')

const router = useRouter()
const settings = ref({});

const API_BASE = import.meta.env.VITE_API_BASE || "";

const logOut = () => {
  state_jwt.value = "";
  router.go(0);
};

const fetchSettings = async () => {
  const response = await fetch(`${API_BASE}/api/v1/settings`, {
    method: "GET",
    headers: {
      "Authorization": `Bearer ${state_jwt.value || "xxx"}`,
      "Content-Type": "application/json"
    },
  });
  if (response.ok) {
    settings.value = await response.json();
  }
}

onMounted(async () => {
  fetchSettings();
});
</script>

<template>
  <n-message-provider>
    <n-grid x-gap="12" :cols="6" y-gap="12">
      <n-gi span="12">
        <div class="main">
          <n-space vertical>
            <h2>All in AI</h2>
            <n-layout>
              <n-alert v-if="false" type="success">
                你好, {{ settings.login_type }} 用户 {{ settings.user_name }}
                <n-button tertiary type="primary" round @click="logOut">登出</n-button>
                <n-button tag="a" target="_blank" tertiary type="primary" round
                  href="https://github.com/dreamhunter2333/chatgpt-tarot-divination">☆ Github</n-button>
              </n-alert>
              <n-alert v-else-if="false" type="warning">
                当前未登录 ({{ settings.rate_limit }})
                <n-button type="warning" round @click="router.push('/login')">登录</n-button>

              </n-alert>
              <n-layout>
                <router-view></router-view>
              </n-layout>
            </n-layout>
          </n-space>
        </div>
      </n-gi>
    </n-grid>
  </n-message-provider>
</template>

<style scoped>

.main {
  text-align: center;
}

.n-grid {
  height: 100%;
}

.n-gi {
  height: 100%;
}

.n-space {
  height: 100%;
}

.n-alert {
  text-align: center;
}
</style>
