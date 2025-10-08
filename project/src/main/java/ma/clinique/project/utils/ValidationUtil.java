package ma.clinique.project.utils;

import java.util.regex.Pattern;

public class ValidationUtil {

    // ===========================
    // Regex patterns
    // ===========================

    // Email pattern
    private static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

    // Password pattern: au moins 6 caractères, peut inclure chiffres, lettres et symboles
    private static final String PASSWORD_REGEX = "^.{6,}$";

    // Phone pattern: chiffres seulement, longueur entre 8 et 15
    private static final String PHONE_REGEX = "^[0-9]{8,15}$";

    // Name pattern: lettres et espaces uniquement
    private static final String NAME_REGEX = "^[A-Za-zÀ-ÿ '-]+$";

    // ===========================
    // Fonctions de validation
    // ===========================

    /**
     * Vérifie si l'email est valide
     * @param email - l'email à valider
     * @return true si l'email est correct, false sinon
     */
    public static boolean isValidEmail(String email) {
        if (email == null) return false;
        return Pattern.matches(EMAIL_REGEX, email);
    }
    /**
     * Vérifie si le mot de passe est valide
     * @param password - le mot de passe à valider
     * @return true si le mot de passe a au moins 6 caractères, false sinon
     */

    public static boolean isValidPassword(String password) {
        if (password == null) return false;
        return Pattern.matches(PASSWORD_REGEX, password);
    }

    /**
     * Vérifie si le texte n'est pas vide
     * @param value - le texte à vérifier
     * @return true si le texte n'est pas null et pas vide, false sinon
     */
    public static boolean isNotEmpty(String value) {
        return value != null && !value.trim().isEmpty();
    }

    /**
     * Vérifie si un nombre Float est positif
     * @param number - le nombre à vérifier
     * @return true si le nombre est supérieur à 0
     */
    public static boolean isPositiveNumber(Float number) {
        return number != null && number > 0;
    }

    /**
     * Vérifie si le prénom ou nom contient uniquement des lettres et espaces
     * @param name - prénom ou nom
     * @return true si le nom est valide
     */
    public static boolean isValidName(String name) {
        if (name == null) return false;
        return Pattern.matches(NAME_REGEX, name);
    }

    /**
     * Vérifie si le numéro de téléphone est valide
     * @param phone - numéro à valider
     * @return true si le numéro contient uniquement des chiffres et longueur correcte
     */
    public static boolean isValidPhone(String phone) {
        if (phone == null) return false;
        return Pattern.matches(PHONE_REGEX, phone);
    }

    /**
     * Vérifie si un âge est valide (entier positif)
     * @param age - l'âge à vérifier
     * @return true si l'âge est supérieur à 0
     */
    public static boolean isValidAge(Integer age) {
        return age != null && age > 0;
    }

    /**
     * Vérifie si une taille est valide (positive)
     * @param height - la taille à vérifier
     * @return true si height > 0
     */
    public static boolean isValidHeight(Float height) {
        return height != null && height > 0;
    }

    /**
     * Vérifie si un poids est valide (positif)
     * @param weight - le poids à vérifier
     * @return true si weight > 0
     */
    public static boolean isValidWeight(Float weight) {
        return weight != null && weight > 0;
    }

    /**
     * Vérifie si un champ est null
     * @param obj - objet à vérifier
     * @return true si null, false sinon
     */
    public static boolean isNull(Object obj) {
        return obj == null;
    }

}
