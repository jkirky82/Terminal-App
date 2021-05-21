require "tty-prompt"
class Path
    @@prompt = TTY::Prompt.new

    def three_path
        ['combat','combat','treasure']
        @@prompt.select("What path do you choose", %w(Left Middle Right), max: 1)
        return ['combat','combat','treasure'].sample
    end
end