package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Employee;
public class EmployeeValidator {
    // バリデーション(入力値チェック)を実行する
    public static List<String> validate(Employee e) {
        List<String> errors = new ArrayList<String>();

        String code_error = _validateCode(e.getCode());
        if(!code_error.equals("")) {
            errors.add(code_error);
        }
        String name_error = _validateName(e.getName());
        if(!name_error.equals("")) {
            errors.add(name_error);
        }
        String password_error = _validatePassword(e.getName());
        if(!password_error.equals("")) {
            errors.add(password_error);
        }
        return errors;
    }

    // 社員番号の必須入力チェック
    private static String _validateCode(String code) {
        if(code == null || code.equals("")) {
            return "社員番号を入力してください。";
        }

        return "";
    }

    // 名前の必須入力チェック
    private static String _validateName(String name) {
        if(name == null || name.equals("")) {
            return "名前を入力してください。";
        }

        return "";
    }

    // パスワードの必須入力チェック
    private static String _validatePassword(String password) {
        if(password == null || password.equals("")) {
            return "パスワードを入力してください。";
        }

        return "";
    }
}
