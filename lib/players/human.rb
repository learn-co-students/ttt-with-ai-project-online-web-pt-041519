require "pry"

module Players
   class Human < Player

      #asks for input, then returns it
      def move(input)
         input = gets.strip
         input
      end

   end
end