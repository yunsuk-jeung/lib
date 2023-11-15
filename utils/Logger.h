#pragma once

#include <spdlog/fmt/fmt.h>
#include <spdlog/spdlog.h>

#ifdef __ANDROID__
#include <spdlog/sinks/android_sink.h>
#define ROOT_PATH_SIZE 36
#else
#define ROOT_PATH_SIZE 60
#endif

#define LOGGER_FORMAT "[%^%l%$] %v"
#define PROJECT_NAME "LOG"

#define __FILENAME__ (static_cast<const char*>(__FILE__) + ROOT_PATH_SIZE)
#ifdef _WIN32

#define LOGI(...) spdlog::info(__VA_ARGS__);
#define LOGW(...) spdlog::warn(__VA_ARGS__);
#define LOGE(...)                                                                        \
  spdlog::error("[{}:{}] {}", __FILENAME__, __LINE__, fmt::format(__VA_ARGS__));
#define LOGD(...) spdlog::debug(__VA_ARGS__);

#elif __ANDROID__
class vkLogger {
  static std::shared_ptr<spdlog::logger> android_logger;

public:
  template <typename... Args>
  static void logI(const char* fmt, Args... args) {
    android_logger->info(fmt, args...);
  }
  template <typename... Args>
  static void logW(const char* fmt, Args... args) {
    android_logger->warn(fmt, args...);
  }
  template <typename... Args>
  static void logD(const char* fmt, Args... args) {
    android_logger->debug(fmt, args...);
  }

  template <typename... Args>
  static void logE(const char* fmt, Args... args) {
    android_logger->error("[{}:{}] {}",
                          __FILENAME__,
                          __LINE__,
                          fmt::format(fmt, args...));
  }
};

#define LOGI(fmt, ...) vkLogger::logI(fmt, ##__VA_ARGS__);
#define LOGW(fmt, ...) vkLogger::logW(fmt, ##__VA_ARGS__);
#define LOGE(fmt, ...) vkLogger::logE(fmt, ##__VA_ARGS__);
#define LOGD(fmt, ...) vkLogger::logD(fmt, ##__VA_ARGS__);

#endif