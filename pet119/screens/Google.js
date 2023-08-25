import { View, Text } from "react-native";
import COLORS from "../constants/colors";

const Google = () => {
  console.log("google");
  return (
    <View style={{ marginVertical: 100 }}>
      <Text
        style={{
          fontSize: 30,
          fontWeight: "bold",
          marginVertical: 12,
          color: COLORS.black,
        }}
      >
        Google login
      </Text>
    </View>
  );
};
export default Google;
