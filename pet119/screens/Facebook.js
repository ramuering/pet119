import { View, Text } from "react-native";
import COLORS from "../constants/colors";

const Facebook = () => {
  console.log("facebook");
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
        Facebook login
      </Text>
    </View>
  );
};
export default Facebook;
