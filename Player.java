import java.util.Objects;

public class Player {
    private String name;
    private int lives;
    private int index;

    public Player(String name, int lives, int index) {
        this.name = name;
        this.lives = lives;
        this.index = index;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getLives() {
        return lives;
    }

    public void setLives(int lives) {
        this.lives = lives;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Player player = (Player) o;
        return lives == player.lives && index == player.index && Objects.equals(name, player.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, lives, index);
    }

    @Override
    public String toString() {
        return "Player{" +
                "name='" + name + '\'' +
                ", lives=" + lives +
                ", index=" + index +
                '}';
    }
}
