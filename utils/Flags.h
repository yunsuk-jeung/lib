#include <optional>

template <typename FlagBitsType>
struct FlagTraits {
  static constexpr bool isBitmask = false;
};

template <typename BitType>
class Flags {
public:
  using MaskType = typename std::underlying_type<BitType>::type;

  //constructors
  constexpr Flags() noexcept : m_mask(0) {}

  constexpr Flags(BitType bit) noexcept : m_mask(static_cast<MaskType>(bit)) {}

  constexpr Flags(Flags<BitType> const& rhs) noexcept = default;

  constexpr explicit Flags(MaskType flags) noexcept : m_mask(flags) {}

  constexpr bool operator<(Flags<BitType> const& rhs) const noexcept {
    return m_mask < rhs.m_mask;
  }

  constexpr bool operator<=(Flags<BitType> const& rhs) const noexcept {
    return m_mask <= rhs.m_mask;
  }

  constexpr bool operator>(Flags<BitType> const& rhs) const noexcept {
    return m_mask > rhs.m_mask;
  }

  constexpr bool operator>=(Flags<BitType> const& rhs) const noexcept {
    return m_mask >= rhs.m_mask;
  }

  constexpr bool operator==(Flags<BitType> const& rhs) const noexcept {
    return m_mask == rhs.m_mask;
  }

  constexpr bool operator!=(Flags<BitType> const& rhs) const noexcept {
    return m_mask != rhs.m_mask;
  }

  //logical operator
  constexpr bool operator!() const noexcept { return !m_mask; }

  //bitwise operators
  constexpr Flags<BitType> operator&(Flags<BitType> const& rhs) const noexcept {
    return Flags<BitType>(m_mask & rhs.m_mask);
  }

  constexpr Flags<BitType> operator|(Flags<BitType> const& rhs) const noexcept {
    return Flags<BitType>(m_mask | rhs.m_mask);
  }

  constexpr Flags<BitType> operator^(Flags<BitType> const& rhs) const noexcept {
    return Flags<BitType>(m_mask ^ rhs.m_mask);
  }

  constexpr Flags<BitType> operator~() const noexcept {
    return Flags<BitType>(m_mask ^ FlagTraits<BitType>::allFlags.m_mask);
  }

  //assignment operators
  constexpr Flags<BitType>& operator=(Flags<BitType> const& rhs) noexcept = default;

  constexpr Flags<BitType>& operator|=(Flags<BitType> const& rhs) noexcept {
    m_mask |= rhs.m_mask;
    return *this;
  }

  constexpr Flags<BitType>& operator&=(Flags<BitType> const& rhs) noexcept {
    m_mask &= rhs.m_mask;
    return *this;
  }

  constexpr Flags<BitType>& operator^=(Flags<BitType> const& rhs) noexcept {
    m_mask ^= rhs.m_mask;
    return *this;
  }

  //cast operators
  explicit constexpr operator bool() const noexcept { return !!m_mask; }

  explicit constexpr operator MaskType() const noexcept { return m_mask; }

private:
  MaskType m_mask;
};

template <typename BitType>
constexpr bool operator<(BitType bit, Flags<BitType> const& flags) noexcept {
  return flags.operator>(bit);
}

template <typename BitType>
constexpr bool operator<=(BitType bit, Flags<BitType> const& flags) noexcept {
  return flags.operator>=(bit);
}

template <typename BitType>
constexpr bool operator>(BitType bit, Flags<BitType> const& flags) noexcept {
  return flags.operator<(bit);
}

template <typename BitType>
constexpr bool operator>=(BitType bit, Flags<BitType> const& flags) noexcept {
  return flags.operator<=(bit);
}

template <typename BitType>
constexpr bool operator==(BitType bit, Flags<BitType> const& flags) noexcept {
  return flags.operator==(bit);
}

template <typename BitType>
constexpr bool operator!=(BitType bit, Flags<BitType> const& flags) noexcept {
  return flags.operator!=(bit);
}

//bitwise operators
template <typename BitType>
constexpr Flags<BitType> operator&(BitType bit, Flags<BitType> const& flags) noexcept {
  return flags.operator&(bit);
}

template <typename BitType>
constexpr Flags<BitType> operator|(BitType bit, Flags<BitType> const& flags) noexcept {
  return flags.operator|(bit);
}

template <typename BitType>
constexpr Flags<BitType> operator^(BitType bit, Flags<BitType> const& flags) noexcept {
  return flags.operator^(bit);
}

//bitwise operators on BitType
template <typename BitType,
          typename std::enable_if<FlagTraits<BitType>::isBitmask, bool>::type = true>
inline constexpr Flags<BitType> operator&(BitType lhs, BitType rhs) noexcept {
  return Flags<BitType>(lhs) & rhs;
}

template <typename BitType,
          typename std::enable_if<FlagTraits<BitType>::isBitmask, bool>::type = true>
inline constexpr Flags<BitType> operator|(BitType lhs, BitType rhs) noexcept {
  return Flags<BitType>(lhs) | rhs;
}

template <typename BitType,
          typename std::enable_if<FlagTraits<BitType>::isBitmask, bool>::type = true>
inline constexpr Flags<BitType> operator^(BitType lhs, BitType rhs) noexcept {
  return Flags<BitType>(lhs) ^ rhs;
}

template <typename BitType,
          typename std::enable_if<FlagTraits<BitType>::isBitmask, bool>::type = true>
inline constexpr Flags<BitType> operator~(BitType bit) noexcept {
  return ~(Flags<BitType>(bit));
}

enum class SampleBits { ONE = 1 << 0, TWO = 1 << 1, FOUR = 1 << 2 };

using SampleBitsFlags = Flags<SampleBits>;

template <>
struct FlagTraits<SampleBits> {
  static constexpr bool            isBitmask = true;
  static constexpr SampleBitsFlags allFlags =
      SampleBits::ONE | SampleBits::TWO | SampleBits::FOUR;
};
