package com.quitter.app

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.NavHostFragment
import com.quitter.app.databinding.FragmentFirstBinding

class FirstFragment : Fragment() {
    private var binding: FragmentFirstBinding? = null

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentFirstBinding.inflate(inflater, container, false)
        return binding!!.getRoot()
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        binding!!.buttonFirst.setOnClickListener(View.OnClickListener { v: View? ->
            NavHostFragment.findNavController(this@FirstFragment)
                .navigate(R.id.action_FirstFragment_to_SecondFragment)
        }
        )
    }

    override fun onDestroyView() {
        super.onDestroyView()
        binding = null
    }
}