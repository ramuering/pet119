import {
  View,
  Text,
  Image,
  Pressable,
  TextInput,
  TouchableOpacity,
  Alert,
} from "react-native";
import React, { useState } from "react";
import { SafeAreaView } from "react-native-safe-area-context";
import COLORS from "../constants/colors";
import { Ionicons } from "@expo/vector-icons";
import Button from "../components/Button";

const Signup = ({ navigation }) => {
  const [isPasswordShown, setIsPasswordShown] = useState(false);
  const [name, setName] = useState("");
  const [username, setUsername] = useState("");
  const [phoneNumber, setPhoneNumber] = useState("");
  const [password, setPassword] = useState("");

  const handleSignup = async () => {
    try {
      const response = await fetch(
        "https://1h3q821aeg.execute-api.ap-northeast-2.amazonaws.com/default/pet119_login",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            name,
            username,
            phoneNumber,
            password,
          }),
        }
      );
      const data = await response.json();
      if (response.ok) {
        Alert.alert("회원 가입 성공", data.message);
        // 회원 가입 성공 시 추가적인 처리 작성
        // 예를 들어, 로그인 화면으로 이동
        navigation.navigate("Login");
      } else {
        Alert.alert("회원 가입 실패", data.message);
      }
    } catch (error) {
      console.error("에러:", error);
      Alert.alert("서버 에러", "서버 에러가 발생했습니다.");
    }
  };
  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: COLORS.white }}>
      <View style={{ flex: 1, marginHorizontal: 22 }}>
        <View style={{ marginVertical: 22 }}>
          <Text
            style={{
              fontSize: 30,
              fontWeight: "bold",
              marginVertical: 12,
              color: COLORS.black,
            }}
          >
            회원가입
          </Text>
        </View>

        <View style={{ marginBottom: 12 }}>
          <View
            style={{
              width: "100%",
              height: 48,
              borderColor: COLORS.black,
              borderWidth: 1,
              borderRadius: 8,
              alignItems: "center",
              justifyContent: "center",
              paddingLeft: 22,
            }}
          >
            <TextInput
              placeholder="이름"
              value={name}
              onChangeText={(text) => setName(text)}
              placeholderTextColor={COLORS.black}
              keyboardType="email-address"
              style={{
                width: "100%",
              }}
            />
          </View>
        </View>
        <View
          style={{
            marginBottom: 12,
            flexDirection: "row",
            alignItems: "center",
          }}
        >
          <View
            style={{
              width: "80%",
              height: 48,
              borderColor: COLORS.black,
              borderWidth: 1,
              borderRadius: 8,
              alignItems: "center",
              justifyContent: "center",
              paddingLeft: 22,
              marginRight: 8, // 여기에 margin 추가
            }}
          >
            <TextInput
              placeholder="아이디"
              value={username}
              onChangeText={(text) => setUsername(text)}
              placeholderTextColor={COLORS.black}
              keyboardType="email-address"
              style={{
                width: "100%",
              }}
            />
          </View>
          <Button
            title="중복확인"
            filled
            style={{
              width: "18%",
              height: 48,
              marginRight: 15,
              marginBottom: 4,
            }}
          />
        </View>

        <View
          style={{
            marginBottom: 12,
            flexDirection: "row",
            alignItems: "center",
          }}
        >
          <View
            style={{
              width: "80%",
              height: 48,
              borderColor: COLORS.black,
              borderWidth: 1,
              borderRadius: 8,
              alignItems: "center",
              flexDirection: "row",
              justifyContent: "space-between",
              paddingLeft: 22,
              marginRight: 8,
            }}
          >
            <TextInput
              placeholder="+82"
              placeholderTextColor={COLORS.black}
              keyboardType="numeric"
              style={{
                width: "12%",
                borderRightWidth: 1,
                borderLeftColor: COLORS.grey,
                height: "100%",
              }}
            />
            <TextInput
              placeholder="전화번호"
              value={phoneNumber}
              onChangeText={(text) => setPhoneNumber(text)}
              placeholderTextColor={COLORS.black}
              keyboardType="numeric"
              style={{
                width: "80%",
              }}
            />
          </View>
          <Button
            title="인증"
            filled
            style={{
              width: "18%",
              height: 48,
              marginRight: 15,
              marginBottom: 4,
            }}
          />
        </View>
        <View style={{ marginBottom: 12 }}>
          <View
            style={{
              width: "100%",
              height: 48,
              borderColor: COLORS.black,
              borderWidth: 1,
              borderRadius: 8,
              alignItems: "center",
              justifyContent: "center",
              paddingLeft: 22,
            }}
          >
            <TextInput
              placeholder="인증번호"
              placeholderTextColor={COLORS.black}
              keyboardType="email-address"
              style={{
                width: "100%",
              }}
            />
          </View>
        </View>
        <View
          style={{
            marginBottom: 12,
            flexDirection: "row",
            alignItems: "center",
          }}
        >
          <View
            style={{
              width: "100%",
              height: 48,
              borderColor: COLORS.black,
              borderWidth: 1,
              borderRadius: 8,
              alignItems: "center",
              justifyContent: "center",
              paddingLeft: 22,
            }}
          >
            <TextInput
              placeholder="비밀번호"
              value={password}
              onChangeText={(text) => setPassword(text)}
              placeholderTextColor={COLORS.black}
              secureTextEntry={isPasswordShown}
              style={{
                width: "100%",
              }}
            />
            <TouchableOpacity
              onPress={() => setIsPasswordShown(!isPasswordShown)}
              style={{
                position: "absolute",
                right: 12,
              }}
            >
              {isPasswordShown == true ? (
                <Ionicons name="eye-off" size={24} color={COLORS.black} />
              ) : (
                <Ionicons name="eye" size={24} color={COLORS.black} />
              )}
            </TouchableOpacity>
          </View>
        </View>
        <View style={{ marginBottom: 12 }}>
          <View
            style={{
              width: "100%",
              height: 48,
              borderColor: COLORS.black,
              borderWidth: 1,
              borderRadius: 8,
              alignItems: "center",
              justifyContent: "center",
              paddingLeft: 22,
            }}
          >
            <TextInput
              placeholder="비밀번호확인"
              placeholderTextColor={COLORS.black}
              secureTextEntry={isPasswordShown}
              style={{
                width: "100%",
              }}
            />
            <TouchableOpacity
              onPress={() => setIsPasswordShown(!isPasswordShown)}
              style={{
                position: "absolute",
                right: 12,
              }}
            >
              {isPasswordShown == true ? (
                <Ionicons name="eye-off" size={24} color={COLORS.black} />
              ) : (
                <Ionicons name="eye" size={24} color={COLORS.black} />
              )}
            </TouchableOpacity>
          </View>
        </View>
        <View
          style={{
            flexDirection: "row",
            marginVertical: 6,
          }}
        ></View>
        <TouchableOpacity onPress={handleSignup}>
          <Button
            title="완료"
            filled
            style={{
              marginTop: 18,
              marginBottom: 4,
            }}
          />
        </TouchableOpacity>

        <View
          style={{
            flexDirection: "row",
            alignItems: "center",
            marginVertical: 20,
          }}
        >
          <View
            style={{
              flex: 1,
              height: 1,
              backgroundColor: COLORS.grey,
              marginHorizontal: 10,
            }}
          />
          <Text style={{ fontSize: 14 }}>sns계정 연동</Text>
          <View
            style={{
              flex: 1,
              height: 1,
              backgroundColor: COLORS.grey,
              marginHorizontal: 10,
            }}
          />
        </View>

        <View
          style={{
            flexDirection: "row",
            justifyContent: "center",
          }}
        >
          <TouchableOpacity
            onPress={() => console.log("Pressed")}
            style={{
              flex: 1,
              alignItems: "center",
              justifyContent: "center",
              flexDirection: "row",
              height: 52,
              borderWidth: 1,
              borderColor: COLORS.grey,
              marginRight: 4,
              borderRadius: 10,
            }}
          >
            <Image
              source={require("../assets/facebook.png")}
              style={{
                height: 36,
                width: 36,
                marginRight: 8,
              }}
              resizeMode="contain"
            />

            <Text>Facebook</Text>
          </TouchableOpacity>

          <TouchableOpacity
            onPress={() => console.log("Pressed")}
            style={{
              flex: 1,
              alignItems: "center",
              justifyContent: "center",
              flexDirection: "row",
              height: 52,
              borderWidth: 1,
              borderColor: COLORS.grey,
              marginRight: 4,
              borderRadius: 10,
            }}
          >
            <Image
              source={require("../assets/google.png")}
              style={{
                height: 36,
                width: 36,
                marginRight: 8,
              }}
              resizeMode="contain"
            />

            <Text>Google</Text>
          </TouchableOpacity>
        </View>

        <View
          style={{
            flexDirection: "row",
            justifyContent: "center",
            marginVertical: 22,
          }}
        >
          <Text style={{ fontSize: 16, color: COLORS.black }}>
            이미 계정이 있으시다면?
          </Text>
          <Pressable onPress={() => navigation.navigate("Login")}>
            <Text
              style={{
                fontSize: 16,
                color: COLORS.primary,
                fontWeight: "bold",
                marginLeft: 6,
              }}
            >
              로그인
            </Text>
          </Pressable>
        </View>
      </View>
    </SafeAreaView>
  );
};

export default Signup;
