import java.util.*;

public class PoschenNew {
    private static Map<Integer, Player> players = new HashMap<>();
    Scanner scanner = new Scanner(System.in);
    Random random = new Random();
    private int valueFirstThrow;
    private int valueSecondThrow;
    private int dice1;
    private int dice2;

    public static void main(String[] args) {
        PoschenNew poschenNew = new PoschenNew();
        poschenNew.initPlayers();

        try {
            poschenNew.startGame(players.get(1), players.get(2), 0);
        } catch (NullPointerException e) {
            System.out.println("Player is null");
        }

    }

    public int getDice1() {
        dice1 = (int) (Math.random() * (6 - 1 + 1) + 1);
        return dice1;
    }

    public int getDice2() {
        dice2 = (int) (Math.random() * (6 - 1 + 1) + 1);
        return dice2;
    }

    public int getValueFirstThrow(String throw1) {
        valueFirstThrow = Integer.valueOf(throw1);
        return valueFirstThrow;
    }

    public int getValueSecondThrow(String throw2) {
        valueSecondThrow = Integer.valueOf(throw2);
        return valueSecondThrow;
    }

    //Dice
    public String getDice(int dice1, int dice2) {

        String str = "";
        if (dice1 > dice2 && dice1 != dice2) {
            str += String.valueOf(dice1) + String.valueOf(dice2);
        } else if (dice1 < dice2 && dice1 != dice2) {
            str += String.valueOf(dice2) + String.valueOf(dice1);

        } else if (dice1 == dice2) {
            str += String.valueOf(dice1) + String.valueOf(dice2);
        }

        return str;
    }

    public String getName(String dice) {
        String name = "";
        if (dice == null) {
            throw new NoSuchElementException("no data found!");
        }
        switch (dice) {
            case "11":
                name = "Einser Posch (11)";
                break;
            case "22":
                name = "Zweier Posch (22)";
                break;
            case "33":
                name = "Dreier Posch (33)";
                break;
            case "44":
                name = "Vierer Posch (44)";
                break;
            case "55":
                name = "Fünfer Posch (55)";
                break;
            case "66":
                name = "Sechser Posch (66)";
                break;
            case "21":
                name = "Maier (21)";
                break;
            default:
                name = dice;
                break;
        }
        return name;
    }

    public boolean isAposch(int throwToInspect) {
        if (throwToInspect == 11 || throwToInspect == 22 || throwToInspect == 33 || throwToInspect == 44 || throwToInspect == 55 || throwToInspect == 66) {
            return true;
        } else {
            return false;
        }
    }

    //Players
    public void initPlayers() {
        players.put(1, new Player("David", 1, 1));
        players.put(2, new Player("Felix", 1, 2));
        players.put(3, new Player("Arthur", 1, 3));

    }

    public void removeLive(Player player, int nuLivesToRemove) {
        int index = player.getIndex();

        if (player.getLives() - nuLivesToRemove < 0) {
            System.out.println("Sorry " + player.getName() + "! You are out");
            deletePlayer(player);


            if (players.size() == 1) {
                winner(players.get(1));
            }

            if (index > players.size()) {
                startGame(players.get(1), players.get(2), 0);
            } else if (index == players.size()) {
                startGame(players.get(players.size()), players.get(1), 0);
            } else {
                startGame(players.get(index), players.get(index + 1), 0);
            }
        } else {
            if (index == players.size()) {
                index = 0;
            }
            player.setLives(player.getLives() - nuLivesToRemove);
            startGame(player, players.get(index + 1), 0);
        }

    }

    public void deletePlayer(Player player) {
        Player playerToRemove = players.get(player.getIndex());
        int index = playerToRemove.getIndex();

        try {

            if (index == players.size()) {
                System.out.println("");
            } else {
                for (int i = index + 1; i < players.size() + 1; i++) {
                   //System.out.println(players.get(i) + " index is current : " + players.get(i).getIndex() + " and will be set to " + (players.get(i).getIndex() - 1) + "");
                    players.get(i).setIndex((players.get(i).getIndex()) - 1);
                }
            }
            for (Map.Entry<Integer, Player> curr : players.entrySet()) {
               // System.out.println("CUURREENT:" + curr);
                if (curr.getKey() == playerToRemove.getIndex()) {
                    //System.out.println(curr + " is going to be removed");
                    players.remove(curr.getKey());
                    System.out.println("Remaining players: " + players);
                    break;
                }
            }

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        Map<Integer, Player> newMap = new HashMap<>();
        for (Map.Entry<Integer, Player> current : players.entrySet()) {
            int key = current.getValue().getIndex();
            newMap.put(key, current.getValue());
        }
        players = newMap;

    }

    public void winner(Player player) {
        System.out.println("GAME IS OVER");
        System.out.println(player.getName() + " wins with " + player.getLives() + " lives remaining!");
        System.out.println("-----------------------------------------------");
        System.exit(0);
    }

    //Game

    public boolean lowerThanThrow(int realThrow, int throwToCompare) {
        if (isAposch(realThrow) == true && isAposch(throwToCompare) == false) {
            return false;
        } else if (isAposch(realThrow) == false && isAposch(throwToCompare) == true) {
            return true;
        } else if (realThrow <= throwToCompare) {
            return true;
        }
        return false;
    }

    public void startGame(Player playerA, Player playerB, int valueToOverthrow) {
        System.out.println("Its now your turn " + playerA.getName() + "!");
        int firstThrow = Integer.parseInt(getDice(getDice1(), getDice2()));
        int realThrow = firstThrow;
        //int secondThrow = Integer.parseInt(getDice(getDice1(), getDice2()));

        System.out.println(playerA.getName() + " " + firstThrow + " (current lives: " + playerA.getLives() + ")");
        if (valueToOverthrow > 0 && isMaier(firstThrow) == false) {
            if (lowerThanThrow(firstThrow, valueToOverthrow) == true || firstThrow == valueToOverthrow) {
                firstThrow = getNextValue(valueToOverthrow);
            }
        }
        if (isMaier(firstThrow)) {
            maierSituiation(playerA, playerB, realThrow);
        }

        realGame(playerA, firstThrow, playerB, valueToOverthrow, realThrow);
    }

    public void realGame(Player playerA, int dicePlayerA, Player playerB, int valueToOverthrow, int realThrow) {
        Scanner scanner = new Scanner(System.in);
        System.out.println(playerA.getName() + " called " + dicePlayerA);
        System.out.println(playerB.getName() + " has to decide if he believes " + playerA.getName() + "\t[b] for believe|[n] not believe");
        char blieve = scanner.next().charAt(0);
        switch (blieve) {
            case 'b':
                int index = playerB.getIndex();
                if (index == players.size()) {
                    index = 0;
                }
                startGame(playerB, players.get(index + 1), dicePlayerA);
                break;
            default:
                System.out.println(playerB.getName() + " doesnt believe " + playerA.getName());
                notBelieveSituation(playerA, playerB, dicePlayerA, valueToOverthrow, realThrow);
                break;
        }


    }

    public void notBelieveSituation(Player playerA, Player playerB, int dicePlayerA, int valueToOverthrow, int realThrow) {
        if (lowerThanThrow(realThrow, valueToOverthrow)) {
            System.out.println("######" + playerA.getName() + " really lied to " + playerB.getName());
            System.out.println("Now " + playerA.getName() + " will lose 1 life");
            removeLive(playerA, 1);
        } else if (lowerThanThrow(realThrow, valueToOverthrow) == false) {
            System.out.println("#####" + playerA.getName() + " told the truth");
            System.out.println("Now " + playerB.getName() + " will lose 1 life");
            removeLive(playerB, 1);
        }
    }

    public void maierSituiation(Player playerWithMaier, Player playerWithoutMaier, int realThrow) {
        System.out.println(playerWithMaier.getName() + " has a Maier, so now " + playerWithoutMaier.getName() + " has to decide if he really believes " + playerWithMaier.getName());
        System.out.println("Press [b] for believe an [n] for not believe");
        Scanner scanner = new Scanner(System.in);
        char choice = scanner.next().charAt(0);
        switch (choice) {
            case 'n':
                if (isMaier(realThrow) == false) {
                    System.out.println("Oh no! " + playerWithMaier.getName() + " lied to " + playerWithoutMaier.getName());
                    System.out.println("Now " + playerWithMaier.getName() + " will lose 2 lives!");
                    removeLive(playerWithMaier, 2);
                } else {
                    System.out.println(playerWithMaier.getName() + " really has a Maier!");
                    System.out.println("Now " + playerWithoutMaier.getName() + " will lose 2 lives!");
                    removeLive(playerWithoutMaier, 2);
                }
                break;

            case 'b':
                System.out.println(playerWithoutMaier.getName() + " believes " + playerWithMaier.getName() + " and only loses 1 live");
                System.out.println("No one will ever know if " + playerWithMaier.getName() + " had a Maier...");
                removeLive(playerWithoutMaier, 1);
        }
    }

    public int getNextValue(int ausgangsThrow) {
        int newThrow = 0;
        switch (ausgangsThrow) {
            case 11:
                newThrow = 22;
                break;
            case 22:
                newThrow = 33;
                break;
            case 32:
                newThrow = 41;
                break;
            case 33:
                newThrow = 44;
                break;
            case 43:
                newThrow = 51;
                break;
            case 44:
                newThrow = 55;
                break;
            case 54:
                newThrow = 61;
                break;
            case 55:
                newThrow = 66;
                break;
            case 65:
                newThrow = 11;
                break;
            case 66:
                newThrow = 21;
                break;
            default:
                newThrow = ausgangsThrow + 1;
                break;
        }
        return newThrow;
    }

    public boolean isMaier(int valueThrow) {
        if (valueThrow == 21) {
            return true;
        }
        return false;
    }
}
