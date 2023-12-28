#pragma once

#include <vector>
#include <filesystem>

namespace io {
namespace util {
inline void createDirectory(const std::filesystem::path& path) {
  if (!std::filesystem::exists(path)) {
    std::filesystem::create_directories(path);
  }
}
inline std::vector<std::filesystem::path> getFiles(const std::filesystem::path& dir,
                                                   const std::filesystem::path& ext) {
  std::vector<std::filesystem::path> out;

  for (const auto& entry : std::filesystem::directory_iterator(dir)) {
    if (entry.is_regular_file()) {
      std::filesystem::path filePath = entry.path();

      if (filePath.extension() == ext || filePath.extension() == ext) {
        out.push_back(filePath);
      }
    }
  }

  return out;
}

}  //namespace util
}  //namespace io
